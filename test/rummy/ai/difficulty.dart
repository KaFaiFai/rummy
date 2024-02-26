import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/tile.dart';
import 'package:rummy/rummy/puzzle.dart';

void main() {
  group('difficulty', () {
    test('trivial', () {
      final solution = [
        (Group(), [Tile(3, 1), Tile(3, 2), Tile(3, 3)])
      ];
      final meldTiles = [
        (Group(), [Tile(3, 1), Tile(3, 2), Tile(3, 3)])
      ];
      final hands = <Tile>[];
      final puzzle = Puzzle([Run(), Group()], solution, meldTiles, hands);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });

    test('easy', () {
      final solution = [
        (Group(), [Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)])
      ];
      final meldTiles = [
        (Group(), [Tile(3, 1), Tile(3, 2), Tile(3, 3)])
      ];
      final hands = [Tile(3, 0)];
      final puzzle = Puzzle([Run(), Group()], solution, meldTiles, hands);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });

    test('medium', () {
      final solution = [
        (Group(), [Tile(3, 0), Tile(3, 1), Tile(3, 2)]),
        (Run(), [Tile(3, 3), Tile(4, 3), Tile(5, 3)]),
      ];
      final meldTiles = [
        (Group(), [Tile(3, 1), Tile(3, 2), Tile(3, 3)]),
      ];
      final hands = [Tile(3, 0), Tile(4, 3), Tile(5, 3)];
      final puzzle = Puzzle([Run(), Group()], solution, meldTiles, hands);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });

    test('difficult', () {
      // final tiles1 = [Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      // final tiles2 = [Tile(2, 1), Tile(2, 2), Tile(2, 3)];
      // final difficulty = RummyAi.difficulty(tiles1, tiles2);
      // expect(difficulty, equals(0));
    });

    test('generated puzzle', () {
      final rnd = Random();
      final tiles = Tile.getAllTiles() + Tile.getAllTiles();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(tiles, melds, random: rnd, maxTilesLength: 5, maxMeldTiles: 7);
      print(puzzle);
      final difficulty = RummyAi.difficulty(puzzle);
      print(difficulty);
    });
  });
}
