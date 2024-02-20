import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';
import 'package:rummy/rummy/puzzle.dart';

void main() {
  group('difficulty', () {
    test('easy', () {
      final solution = [
        (Group(), [Card(3, 0), Card(3, 1), Card(3, 2), Card(3, 3)])
      ];
      final meldCards = [
        (Group(), [Card(3, 1), Card(3, 2), Card(3, 3)])
      ];
      final hands = [Card(3, 0)];
      final puzzle = Puzzle([Run(), Group()], solution, meldCards, hands);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });

    test('medium', () {
      final solution = [
        (Group(), [Card(3, 0), Card(3, 1), Card(3, 2)]),
        (Run(), [Card(3, 3), Card(4, 3), Card(5, 3)]),
      ];
      final meldCards = [
        (Group(), [Card(3, 1), Card(3, 2), Card(3, 3)]),
      ];
      final hands = [Card(3, 0), Card(4, 3), Card(5, 3)];
      final puzzle = Puzzle([Run(), Group()], solution, meldCards, hands);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });

    test('difficult', () {
      // final cards1 = [Card(3, 1), Card(3, 2), Card(3, 3)];
      // final cards2 = [Card(2, 1), Card(2, 2), Card(2, 3)];
      // final difficulty = RummyAi.difficulty(cards1, cards2);
      // expect(difficulty, equals(0));
    });

    test('generated puzzle', () {
      final rnd = Random(1);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(cards, melds, random: rnd, maxCardsLength: 5);
      print(puzzle);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });
  });
}
