import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/const.dart';
import 'package:rummy/rummy/models/tile.dart';

void main() {
  group('Tile', () {
    test('serialize', () {
      var tile = Tile(1, 2);
      String jsonString = jsonEncode(tile);
      print(jsonString);
      expect(jsonString, equals('''"1,2"'''));

      var tileJson = jsonDecode(jsonString) as String;
      tile = Tile.fromJson(tileJson);
      print("$tile");
      expect(tile.rank, equals(1));
      expect(tile.suit, equals(2));
    });

    test('getAllTiles', () {
      final tiles = Tile.getAllTiles();
      print(tiles);
      expect(tiles.length, equals(numRank * numSuit));
    });

    test('hash', () {
      final tile = Tile(1, 2);
      final tile2 = Tile(1, 2);
      expect(tile == tile2, equals(true));

      final tiles = {tile, tile2};
      expect(tiles, equals({Tile(1, 2)}));
    });

    test('compare', () {
      final tiles = [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)]..shuffle();
      print(tiles);
      final tilesSorted = tiles..sort();
      expect(tilesSorted, equals([Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)]));
    });
  });
}
