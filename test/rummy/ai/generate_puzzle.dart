import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('generatePuzzle', () {
    test('all cards & all melds', () {
      print("----- all cards & all melds -----");
      final stopwatch = Stopwatch()..start();

      final rnd = Random(2);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(cards, melds, random: rnd);
      print(puzzle);

      stopwatch.stop();
      print("generatePuzzle: ${stopwatch.elapsedMilliseconds / 1000}s");
    });

    test('all cards & all melds with max', () {
      print("----- all cards & all melds with max -----");

      final rnd = Random(2);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(cards, melds, random: rnd, maxCardsLength: 5, maxMeldCards: 5);
      print(puzzle);
    });

    test('cards with duplicates & all melds', () {
      print("----- cards with duplicates & all melds -----");
      final rnd = Random(1);
      final cards = [Card(0, 0), Card(0, 1), Card(0, 2), Card(0, 0), Card(0, 1), Card(0, 2)];
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(cards, melds, random: rnd);
      print(puzzle);
    });
  });
}
