import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('getAllPossibleSamples', () {
    final tiles = Tile.getAllTiles();

    test('run', () {
      final samples = RummyAi.getAllPossibleSamples(tiles, Run());
      print(samples);
    });

    test('group', () {
      final samples = RummyAi.getAllPossibleSamples(tiles, Group());
      print(samples);
    });
  });
}
