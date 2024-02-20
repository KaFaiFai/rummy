import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('generateMeldCards', () {
    test('all cards & all melds', () {
      final rnd = Random(0);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMeldCards(cards, melds, random: rnd);
      print(samples);
    });

    test('random cards & all melds', () {
      final rnd = Random(0);
      final cards = Card.getAllCards()
        ..shuffle(rnd)
        ..sublist(rnd.nextInt(Card.getAllCards().length));
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMeldCards(cards, melds, random: rnd);
      print(samples);
    });

    test('cards with duplicates & all melds', () {
      final rnd = Random(0);
      final cards = [Card(0, 0), Card(0, 1), Card(0, 2), Card(0, 0), Card(0, 1), Card(0, 2)];
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMeldCards(cards, melds, random: rnd);
      print(samples);
    });
  });
}
