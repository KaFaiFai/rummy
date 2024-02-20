import 'dart:math';

import 'package:rummy/rummy/const.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/puzzle.dart';

import '../models/card.dart';

class RummyAi {
  RummyAi._();

  static List<List<Card>> getAllPossibleSamples(List<Card> cards, Meld meld) {
    return meld.getAllPossibleSamples(cards);
  }

  static List<Card>? getRandomSample(List<Card> cards, Meld meld, {Random? random}) {
    return meld.getRandomSample(cards, random: random);
  }

  static List<(List<Card>, Meld)> generateMelds(List<Meld> melds, {List<Card>? cards, Random? random}) {
    throw UnimplementedError();
  }

  static Puzzle? generatePuzzle(List<Meld> melds, {Random? random}) {
    throw UnimplementedError();
  }
}

extension _RummyAiExtension on Meld {
  /// helper function for getRandomSample()
  /// sometimes, it does not make sense to implement this function
  List<List<Card>> getAllPossibleSamples(List<Card> cards) {
    switch (this) {
      case Run():
        final List<List<Card>> runs = [];
        for (var i = 0; i < numSuit; i++) {
          // unique cards of current suit
          final suit = cards.where((e) => e.suit == i).toSet().toList();
          suit.sort();

          if (suit.length > 1) {
            List<Card> run = [suit.first];
            for (var i = 1; i < suit.length; i++) {
              if (suit[i].rank == run.last.rank + 1) {
                run.add(suit[i]);
              } else {
                if (run.length >= minMeldNum) {
                  runs.add(run);
                  run = [];
                }
              }
            }
            if (run.length >= minMeldNum) {
              runs.add(run);
              run = [];
            }
          }
        }

        return runs;
      case Group():
        throw UnimplementedError();
    }
  }

  List<Card>? getRandomSample(List<Card> cards, {Random? random}) {
    final rnd = random ?? Random();

    List<Card>? samples;
    switch (this) {
      case Run():
        final List<List<Card>> runs = getAllPossibleSamples(cards);

        if (runs.isNotEmpty) {
          final randomRunIndex = rnd.nextInt(runs.length);
          final randomRun = runs[randomRunIndex];
          final randomRunLength = rnd.nextInt(randomRun.length - (minMeldNum - 1)) + minMeldNum;
          final randomRunStart = rnd.nextInt(randomRun.length - (randomRunLength - 1));
          samples = randomRun.sublist(randomRunStart, randomRunStart + randomRunLength);
        }
      case Group():
        throw UnimplementedError();
    }

    if (samples == null) {
      return null;
    }
    assert(checkCards(samples));
    return arrangeCards(samples);
  }
}
