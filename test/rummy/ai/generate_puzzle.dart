import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('generatePuzzle', () {
    test('all cards & all melds', () {
      final rnd = Random(1);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(cards, melds, random: rnd);
      print(puzzle);
    });

    test('cards with duplicates & all melds', () {
      final rnd = Random(1);
      final cards = [Card(0, 0), Card(0, 1), Card(0, 2), Card(0, 0), Card(0, 1), Card(0, 2)];
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(cards, melds, random: rnd);
      print(puzzle);
    });
  });
}
