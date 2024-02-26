import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/tile.dart';

void main() {
  group('similarity', () {
    test('same', () {
      final tiles1 = [Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      final tiles2 = [Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      final similarity = RummyAi.similarity(tiles1, tiles2);
      expect(similarity, equals(1));
    });

    test('similar', () {
      final tiles1 = [Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      final tiles2 = [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      final similarity = RummyAi.similarity(tiles1, tiles2);
      expect(similarity, equals(6 / 8));
    });

    test('different', () {
      final tiles1 = [Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      final tiles2 = [Tile(2, 1), Tile(2, 2), Tile(2, 3)];
      final similarity = RummyAi.similarity(tiles1, tiles2);
      expect(similarity, equals(0));
    });
  });
}
