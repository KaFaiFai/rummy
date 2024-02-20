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

  static List<Card>? getRandomSample(List<Card> cards, Meld meld, {Random? random}) {
    return meld.getRandomSample(cards, random: random);
  }

  /// repeatedly getting a random sample from a random meld until there is no valid option
  static List<(Meld, List<Card>)> generateMeldCards(List<Card> cards, List<Meld> melds, {Random? random}) {
    final rnd = random ?? Random();

    final meldCards = <(Meld, List<Card>)>[];
    final remainingCards = [...cards];
    final remainingMelds = [...melds];

    while (remainingMelds.isNotEmpty) {
      final randomIndex = rnd.nextInt(remainingMelds.length);
      final meld = remainingMelds[randomIndex];
      final randomSample = getRandomSample(remainingCards, meld, random: random);

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

  static Puzzle generatePuzzle(List<Card> cards, List<Meld> melds, {Random? random}) {
    final allPuzzleMeldCards = generateMeldCards(cards, melds, random: random);
    final allPuzzleCards = allPuzzleMeldCards.expand((e) => e.$2).toList();

    final initialMeldCards = generateMeldCards(allPuzzleCards, melds);
    final initialCards = initialMeldCards.expand((e) => e.$2).toList();

    final hands = [...allPuzzleCards];
    for (var card in initialCards) {
      hands.remove(card);
    }
    return Puzzle(melds, allPuzzleMeldCards, initialMeldCards, hands);
  }
}
