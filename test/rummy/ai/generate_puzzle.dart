import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('generatePuzzle', () {
    test('all tiles & all melds', () {
      print("----- all tiles & all melds -----");
      final stopwatch = Stopwatch()..start();

      final rnd = Random(2);
      final tiles = Tile.getAllTiles();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(tiles, melds, random: rnd);
      print(puzzle);

      stopwatch.stop();
      print("generatePuzzle: ${stopwatch.elapsedMilliseconds / 1000}s");
    });

    test('all tiles & all melds with max', () {
      print("----- all tiles & all melds with max -----");

      final rnd = Random(2);
      final tiles = Tile.getAllTiles();
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(tiles, melds, random: rnd, maxTilesLength: 5, maxMeldTiles: 5);
      print(puzzle);
    });

    test('tiles with duplicates & all melds', () {
      print("----- tiles with duplicates & all melds -----");
      final rnd = Random(1);
      final tiles = [Tile(0, 0), Tile(0, 1), Tile(0, 2), Tile(0, 0), Tile(0, 1), Tile(0, 2)];
      final melds = [Run(), Group()];

      final puzzle = RummyAi.generatePuzzle(tiles, melds, random: rnd);
      print(puzzle);
    });
  });
}
