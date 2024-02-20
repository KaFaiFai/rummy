import 'dart:math';

import 'package:rummy/rummy/const.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/puzzle.dart';

import '../models/card.dart';

part 'get_all_possible_samples.dart';
part 'get_random_sample.dart';

class RummyAi {
  RummyAi._();

  static List<List<Card>> getAllPossibleSamples(List<Card> cards, Meld meld) {
    return meld.getAllPossibleSamples(cards);
  }

  static List<Card>? getRandomSample(List<Card> cards, Meld meld, {Random? random, int maxLength = 10000}) {
    return meld.getRandomSample(cards, random: random, maxLength: maxLength);
  }

  /// repeatedly getting a random sample from a random meld until there is no valid option
  static List<(Meld, List<Card>)> generateMeldCards(
    List<Card> cards,
    List<Meld> melds, {
    Random? random,
    int maxCardsLength = 10000,
    int maxMeldCards = 10000,
  }) {
    final rnd = random ?? Random();

    final meldCards = <(Meld, List<Card>)>[];
    final remainingCards = [...cards];
    final remainingMelds = [...melds];

    while (remainingMelds.isNotEmpty && meldCards.length < maxMeldCards) {
      final randomIndex = rnd.nextInt(remainingMelds.length);
      final meld = remainingMelds[randomIndex];
      final randomSample = getRandomSample(remainingCards, meld, random: random, maxLength: maxCardsLength);

      if (randomSample != null) {
        meldCards.add((meld, randomSample));
        for (var card in randomSample) {
          remainingCards.remove(card);
        }
      } else {
        remainingMelds.remove(meld);
      }
    }

    return meldCards;
  }

  static Puzzle generatePuzzle(
    List<Card> cards,
    List<Meld> melds, {
    Random? random,
    int maxCardsLength = 10000,
    int maxMeldCards = 10000,
  }) {
    final allPuzzleMeldCards =
        generateMeldCards(cards, melds, random: random, maxCardsLength: maxCardsLength, maxMeldCards: maxMeldCards);
    final allPuzzleCards = allPuzzleMeldCards.expand((e) => e.$2).toList();

    final initialMeldCards = generateMeldCards(allPuzzleCards, melds, random: random, maxCardsLength: maxCardsLength);
    final initialCards = initialMeldCards.expand((e) => e.$2).toList();

    final hands = [...allPuzzleCards];
    for (var card in initialCards) {
      hands.remove(card);
    }
    return Puzzle(melds, allPuzzleMeldCards, initialMeldCards, hands);
  }

  /// 0 - entirely different, 1 - identical
  static double similarity(List<Card> cards1, List<Card> cards2) {
    final extraCards1 = [...cards1];
    for (var card in cards2) {
      extraCards1.remove(card);
    }
    final extraCards2 = [...cards2];
    for (var card in cards1) {
      extraCards2.remove(card);
    }
    final different = extraCards1.length + extraCards2.length;
    final same = cards1.length + cards2.length - different;

    return same / (same + different);
  }

  static double difficulty(Puzzle puzzle) {
    /// 1. calculate the similarity of each solution and puzzle cards pair
    /// 2. match them from the largest similarity using greedy algorithm
    /// 3. any remaining cards are matched with an empty card list
    /// 4. now we have a list of matches which includes all solution and puzzle cards and their similarities
    /// 5. difficulty := ln(sum(1 - similarity) * #solution * #puzzle + e)
    final solutionCards = puzzle.intendedSolution.map((e) => e.$2).toList();
    final puzzleCards = puzzle.meldCards.map((e) => e.$2).toList();

    final similarityScores = <double>[];
    while (solutionCards.isNotEmpty || puzzleCards.isNotEmpty) {
      if (solutionCards.isEmpty) {
        final cards = puzzleCards.first;
        similarityScores.add(similarity(cards, []));
        puzzleCards.remove(cards);
      } else if (puzzleCards.isEmpty) {
        final cards = solutionCards.first;
        similarityScores.add(similarity(cards, []));
        solutionCards.remove(cards);
      } else {
        double similarityScore = 0;
        (List<Card>, List<Card>) match = (solutionCards.first, puzzleCards.first);
        for (var sc in solutionCards) {
          for (var pc in puzzleCards) {
            final sim = similarity(sc, pc);
            if (sim > similarityScore) {
              similarityScore = sim;
              match = (sc, pc);
            }
          }
        }
        similarityScores.add(similarityScore);
        solutionCards.remove(match.$1);
        puzzleCards.remove(match.$2);
      }
    }
    print(similarityScores);
    final difficultyScore = log(similarityScores.map((e) => (1 - e)).reduce((v, e) => v + e) *
            puzzle.intendedSolution.length *
            puzzle.meldCards.length +
        e);

    return difficultyScore;
  }
}
