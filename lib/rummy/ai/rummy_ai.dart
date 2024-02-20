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

  static List<(List<Card>, Meld)> generateMelds(List<Card> cards, List<Meld> melds, {Random? random}) {
    final rnd = random ?? Random();

    final cardsMeld = <(List<Card>, Meld)>[];
    final remainingCards = [...cards];
    final remainingMelds = [...melds];

    while (remainingMelds.isNotEmpty) {
      final randomIndex = rnd.nextInt(remainingMelds.length);
      final meld = remainingMelds[randomIndex];
      final randomSample = getRandomSample(remainingCards, meld, random: random);

      if (randomSample != null) {
        cardsMeld.add((randomSample, meld));
        for (var card in randomSample) {
          remainingCards.remove(card);
        }
      } else {
        remainingMelds.remove(meld);
      }
    }

    return cardsMeld;
  }

  static Puzzle? generatePuzzle(List<Meld> melds, {Random? random}) {
    throw UnimplementedError();
  }
}
