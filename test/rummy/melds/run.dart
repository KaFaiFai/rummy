import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('Run', () {
    final meldType = Run();

    test('serialize', () {
      final json = meldType.toJson();
      final fromJson = Meld.fromJson(json);
      expect(fromJson, isA<Run>());
    });

    test('arrange', () {
      final tilesInitial = [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)]..shuffle();
      final tilesArranged = meldType.arrangeTiles(tilesInitial);
      print(tilesInitial);
      print(tilesArranged);
      expect(tilesArranged, equals([Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)]));
    });

    test('check - true', () {
      final tiles = [Tile(3, 1), Tile(4, 1), Tile(5, 1)];
      expect(meldType.checkTiles(tiles), equals(true));
    });

    test('check - false', () {
      final tiles = [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)];
      expect(meldType.checkTiles(tiles), equals(false));
    });
  });
}
