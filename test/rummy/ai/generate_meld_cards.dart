import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('generateMeldTiles', () {
    test('all tiles & all melds', () {
      final rnd = Random(0);
      final tiles = Tile.getAllTiles();
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMeldTiles(tiles, melds, random: rnd);
      print(samples);
    });

    test('random tiles & all melds', () {
      final rnd = Random(0);
      final tiles = Tile.getAllTiles()
        ..shuffle(rnd)
        ..sublist(rnd.nextInt(Tile.getAllTiles().length));
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMeldTiles(tiles, melds, random: rnd);
      print(samples);
    });

    test('tiles with duplicates & all melds', () {
      final rnd = Random(0);
      final tiles = [Tile(0, 0), Tile(0, 1), Tile(0, 2), Tile(0, 0), Tile(0, 1), Tile(0, 2)];
      final melds = [Run(), Group()];

      final samples = RummyAi.generateMeldTiles(tiles, melds, random: rnd);
      print(samples);
    });
  });
}
