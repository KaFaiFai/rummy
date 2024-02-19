import 'package:rummy/rummy/const.dart';
import 'package:rummy/rummy/melds/meld.dart';

import '../models/card.dart';

class RummyAi {
  static List<Card>? sampleFromPool(Set<Card> cards, Meld meld) {
    return meld.sampleFromPool(cards);
  }
}

extension RummyAiExtension on Meld {
  List<Card>? sampleFromPool(Set<Card> cards) {
    List<Card>? samples;
    switch (this) {
      case Run():
        final List<List<Card>> runs = [];
        for (var i = 0; i < numSuit; i++) {
          var curCard = Card(0, i);
        }

        samples = [];
      case Group():
      // samples = [];
    }

    if (samples == null) {
      return null;
    }
    assert(checkCards(samples));
    return arrangeCards(samples);
  }
}
