import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('generateMelds', () {
    test('all cards & all melds', () {
      final rnd = Random(0);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMelds(cards, melds, random: rnd);
      print(samples);
    });

    test('random cards & all melds', () {
      final rnd = Random(0);
      final cards = Card.getAllCards()
        ..shuffle(rnd)
        ..sublist(rnd.nextInt(Card.getAllCards().length));
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMelds(cards, melds, random: rnd);
      print(samples);
    });
  });
}
