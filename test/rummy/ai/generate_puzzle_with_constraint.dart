import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';
import 'package:rummy/rummy/puzzle.dart';

void main() {
  group('generatePuzzleWithConstraint', () {
    test('all cards & all melds with max', () {
      int numAttempts = 0;
      bool constraint(Puzzle puzzle) {
        numAttempts++;
        final meldsAppeared = puzzle.meldCards.map((e) => e.$1).toSet();
        if (meldsAppeared.length < puzzle.melds.length) {
          return false;
        }
        final difficulty = RummyAi.difficulty(puzzle);
        return difficulty > 1.5;
      }

      print("----- all cards & all melds with max -----");
      final stopwatch = Stopwatch()..start();

      final rnd = Random(0);
      final cards = Card.getAllCards();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzleWithConstraint(cards, melds, constraint,
          random: rnd, maxCardsLength: 3, maxMeldCards: 3);
      print(puzzle);
      if (puzzle != null) {
        print("Difficulty: ${RummyAi.difficulty(puzzle)}");
      }
      print("Total number of attempts: $numAttempts");

      stopwatch.stop();
      print("generatePuzzleWithConstraint: ${stopwatch.elapsedMilliseconds / 1000}s");
    });
  });
}
