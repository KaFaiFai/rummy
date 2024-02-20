import 'package:rummy/rummy/const.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/puzzle.dart';

import '../models/card.dart';

class RummyAi {
  RummyAi._();

  static List<Card>? sampleFromPool(List<Card> cards, Meld meld) {
    return meld.sampleFromPool(cards);
  }

  static List<(List<Card>, Meld)> generateMelds(List<Meld> melds, [List<Card>? cards]) {
    throw UnimplementedError();
  }

  static Puzzle? generatePuzzle(List<Meld> melds) {
    throw UnimplementedError();
  }
}

extension RummyAiExtension on Meld {
  List<Card>? sampleFromPool(List<Card> cards) {
    List<Card>? samples;
    switch (this) {
      case Run():
        final List<List<Card>> runs = [];
        for (var i = 0; i < numSuit; i++) {
          var curCard = Card(0, i);
        }

        samples = [];
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
