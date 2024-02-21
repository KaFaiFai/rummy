part of 'meld.dart';

/// three or more consecutive cards of the same suit, e.g. 1♡, 2♡, 3♡
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
    if (tiles.length < minMeldUnit) {
      return false;
    }

    final tilesSorted = arrangeTiles(tiles);

    final suit = tilesSorted.first.suit;
    final begin = tilesSorted.first.rank;

    for (var (i, tile) in tilesSorted.indexed) {
      if (tile.rank != begin + i || tile.suit != suit) {
        return false;
      }
    }
    return true;
  }
}
