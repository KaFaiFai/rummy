part of 'meld.dart';

class Run extends Meld {
  @override
  List<Tile> arrangeTiles(List<Tile> tiles) {
    return [...tiles]..sort((tile1, tile2) {
        // Sort by rank first, then suit
        if (tile1.rank != tile2.rank) {
          return tile1.rank.compareTo(tile2.rank);
        } else {
          return tile1.suit.compareTo(tile2.suit);
        }
      });
  }

  @override
  bool checkTiles(List<Tile> tiles) {
    if (tiles.length < minMeldNum) {
      return false;
    }

    final tilesSorted = arrangeTiles(tiles);

    final suit = tilesSorted.first.suit;
    final begin = tilesSorted.first.rank;

    for (var (i, tile) in tilesSorted.indexed) {
      final tileExpected = Tile(begin + i, suit);
      if (tile != tileExpected) {
        return false;
      }
    }
    return true;
  }
}
