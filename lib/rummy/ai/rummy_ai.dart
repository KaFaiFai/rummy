import 'dart:math';

import 'package:rummy/rummy/const.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/puzzle.dart';

import '../models/card.dart';

class RummyAi {
  RummyAi._();

  static List<Card>? getRandomSample(List<Card> cards, Meld meldType, {Random? random}) {
    return meldType.getRandomSample(cards, random: random);
  }

  static List<(List<Card>, Meld)> generateMelds(List<Meld> melds, {List<Card>? cards, Random? random}) {
    throw UnimplementedError();
  }

  static Puzzle? generatePuzzle(List<Meld> melds, {Random? random}) {
    throw UnimplementedError();
  }
}

extension _RummyAiExtension on Meld {
  List<Card>? getRandomSample(List<Card> cards, {Random? random}) {
    final rnd = random ?? Random();

    List<Card>? samples;
    switch (this) {
      case Run():
        // get consecutive ranks
        final List<List<int>> rankRuns = [];
        final uniqueRanks = cards.map((e) => e.rank).toSet().toList()..sort();

        if (uniqueRanks.length > 1) {
          List<int> rankRun = [uniqueRanks.first];
          for (var i = 1; i < uniqueRanks.length; i++) {
            if (uniqueRanks[i] == rankRun.last + 1) {
              rankRun.add(uniqueRanks[i]);
            } else {
              if (rankRun.length >= minMeldNum) {
                rankRuns.add(rankRun);
                rankRun = [];
              }
            }
          }
          if (rankRun.length >= minMeldNum) {
            rankRuns.add(rankRun);
          }
        }

        if (rankRuns.isNotEmpty) {
          // choose a random run
          final randomIndex = rnd.nextInt(rankRuns.length);
          final randomFullRankRun = rankRuns[randomIndex];

          final randomLength = rnd.nextInt(randomFullRankRun.length - (minMeldNum - 1)) + minMeldNum; // 4 -> 3, 4
          final randomStart = rnd.nextInt(randomFullRankRun.length - (randomLength - 1)); // 4 -> 0, 1
          final randomRankRun = randomFullRankRun.sublist(randomStart, randomStart + randomLength);

          // consider the available suits
          samples = [];
          for (var rank in randomRankRun) {
            final availableCards = cards.where((e) => e.rank == rank).toList();
            final randomIndex = rnd.nextInt(availableCards.length);
            samples.add(availableCards[randomIndex]);
          }
        }

      case Group():
        throw UnimplementedError();
    }

    if (samples == null) {
      return null;
    }
    print(samples);
    assert(checkCards(samples));
    return arrangeCards(samples);
  }
}
