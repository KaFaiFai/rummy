import 'dart:math';

import 'package:rummy/rummy/util/const.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/puzzle.dart';
import 'package:rummy/rummy/util/func.dart';

import '../tile.dart';

part 'get_sample_pools.dart';

part 'get_random_sample.dart';

class RummyAi {
  RummyAi._();

  static List<List<Tile>> getSamplePools(List<Tile> tiles, Meld meld) {
    return meld.getSamplePools(tiles);
  }

  static List<Tile>? getRandomSample(List<Tile> tiles, Meld meld, {Random? random, int maxLength = 10000}) {
    return meld.getRandomSample(tiles, random: random, maxLength: maxLength);
  }

  /// repeatedly getting a random sample from a random meld until there is no valid option
  static List<(Meld, List<Tile>)> generateMeldTiles(
    List<Tile> tiles,
    List<Meld> melds, {
    Random? random,
    int maxTilesLength = 10000,
    int maxMeldTiles = 10000,
  }) {
    final rnd = random ?? Random();

    final meldTiles = <(Meld, List<Tile>)>[];
    final remainingTiles = [...tiles];
    final remainingMelds = [...melds];

    while (remainingMelds.isNotEmpty && meldTiles.length < maxMeldTiles) {
      final randomIndex = rnd.nextInt(remainingMelds.length);
      final meld = remainingMelds[randomIndex];
      final randomSample = getRandomSample(remainingTiles, meld, random: random, maxLength: maxTilesLength);

      if (randomSample != null) {
        meldTiles.add((meld, randomSample));
        for (var tile in randomSample) {
          remainingTiles.remove(tile);
        }
      } else {
        remainingMelds.remove(meld);
      }
    }

    return meldTiles;
  }

  static Puzzle generatePuzzle(
    List<Tile> tiles,
    List<Meld> melds, {
    Random? random,
    int maxTilesLength = 10000,
    int maxMeldTiles = 10000,
  }) {
    final allPuzzleMeldTiles =
        generateMeldTiles(tiles, melds, random: random, maxTilesLength: maxTilesLength, maxMeldTiles: maxMeldTiles);
    final allPuzzleTiles = allPuzzleMeldTiles.expand((e) => e.$2).toList();

    final initialMeldTiles = generateMeldTiles(allPuzzleTiles, melds, random: random, maxTilesLength: maxTilesLength);
    final initialTiles = initialMeldTiles.expand((e) => e.$2).toList();

    final hands = [...allPuzzleTiles];
    for (var tile in initialTiles) {
      hands.remove(tile);
    }
    return Puzzle(melds, allPuzzleMeldTiles, initialMeldTiles, hands);
  }

  /// constraint: return true for wanted puzzle
  static Puzzle? generatePuzzleWithConstraint(
    List<Tile> tiles,
    List<Meld> melds,
    bool Function(Puzzle) constraint, {
    Random? random,
    int maxTilesLength = 10000,
    int maxMeldTiles = 10000,
    int maxRetry = 100000,
  }) {
    Puzzle? puzzle;
    int count = 0;
    while (puzzle == null && count < maxRetry) {
      final generatedPuzzle = generatePuzzle(
        tiles,
        melds,
        random: random,
        maxTilesLength: maxTilesLength,
        maxMeldTiles: maxMeldTiles,
      );
      if (constraint(generatedPuzzle)) {
        puzzle = generatedPuzzle;
      }
      count++;
    }
    return puzzle;
  }

  /// 0 - entirely different, 1 - identical
  static double similarity(List<Tile> tiles1, List<Tile> tiles2) {
    final extraTiles1 = [...tiles1];
    for (var tile in tiles2) {
      extraTiles1.remove(tile);
    }
    final extraTiles2 = [...tiles2];
    for (var tile in tiles1) {
      extraTiles2.remove(tile);
    }
    final different = extraTiles1.length + extraTiles2.length;
    final same = tiles1.length + tiles2.length - different;

    return same / (same + different);
  }

  /// ~1 - trivial, ~10 - very hard
  static double difficulty(Puzzle puzzle) {
    /// 1. for each solution tiles, calculate the largest similarity score to puzzle tiles, which has 2 components:
    /// 1a. similarity of (solution tiles, puzzle tiles)
    /// 1b. similarity of (solution tiles, puzzle tiles + hands which are useful to the solution)
    /// 1c. similarity score = average(1a, 1b)
    /// 2. now we have a list of similarity scores for each all solution tiles
    /// 3. difficulty := ln(sum(1 - similarity) * #solution * #puzzle * #melds + e)
    final solutionTiles = puzzle.solution.map((e) => e.$2).toList();
    final puzzleTiles = puzzle.meldTiles.map((e) => e.$2).toList();

    final similarityScores = <double>[];
    for (var sc in solutionTiles) {
      double similarityScore = 0;
      for (var pc in puzzleTiles) {
        final supplementTiles = puzzle.hands.where((e) => sc.contains(e) && !pc.contains(e)).toList();
        final sim = (similarity(sc, pc) + similarity(sc, pc + supplementTiles)) / 2;
        if (sim > similarityScore) {
          similarityScore = sim;
        }
      }
      similarityScores.add(similarityScore);
    }

    final difficultyScore = log(similarityScores.map((e) => (1 - e)).reduce((v, e) => v + e) *
            puzzle.solution.length *
            puzzle.meldTiles.length *
            puzzle.melds.length +
        e);

    return difficultyScore;
  }
}
