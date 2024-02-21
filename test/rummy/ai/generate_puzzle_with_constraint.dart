import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';
import 'package:rummy/rummy/puzzle.dart';

void main() {
  group('generatePuzzleWithConstraint', () {
    test('all tiles & all melds with max', () {
      int numAttempts = 0;
      bool constraint(Puzzle puzzle) {
        numAttempts++;
        final meldsAppeared = puzzle.meldTiles.map((e) => e.$1).toSet();
        if (meldsAppeared.length < puzzle.melds.length) {
          return false;
        }
        final difficulty = RummyAi.difficulty(puzzle);
        return difficulty > 1.5;
      }

      print("----- all tiles & all melds with max -----");
      final stopwatch = Stopwatch()..start();

      final rnd = Random(0);
      final tiles = Tile.getAllTiles();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzleWithConstraint(tiles, melds, constraint,
          random: rnd, maxTilesLength: 3, maxMeldTiles: 3);
      print(puzzle);
      if (puzzle != null) {
        print("Difficulty: ${RummyAi.difficulty(puzzle)}");
      }
      print("Total number of attempts: $numAttempts");

      stopwatch.stop();
      print("generatePuzzleWithConstraint: ${stopwatch.elapsedMilliseconds / 1000}s");
    });
  });
}
