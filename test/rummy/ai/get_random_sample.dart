import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('getRandomSample', () {
    final tiles = Tile.getAllTiles();

    test('run', () {
      final sample = RummyAi.getRandomSample(tiles, Run(), random: Random(0));
      print(sample);
    });

    test('group', () {
      final sample = RummyAi.getRandomSample(tiles, Group(), random: Random(0));
      print(sample);
    });
  });
}
