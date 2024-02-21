import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('getSamplePools', () {
    final tiles = Tile.getAllTiles()..shuffle();

    test('run', () {
      final samples = RummyAi.getSamplePools(tiles, Run());
      print(samples);
    });

    test('group', () {
      final samples = RummyAi.getSamplePools(tiles, Group());
      print(samples);
    });

    test('pairs', () {
      final samples = RummyAi.getSamplePools(tiles, Pairs());
      print(samples);
    });
  });
}
