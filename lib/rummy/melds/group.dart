part of 'meld.dart';

/// three or more cards of the same rank with different suits, e.g. 1♡, 1♣, 1♢
class Group extends Meld {
  @override
  List<Tile> arrangeTiles(List<Tile> tiles) {
    return [...tiles]..sort((tile1, tile2) {
        // Sort by suit first, then rank
        if (tile1.suit != tile2.suit) {
          return tile1.suit.compareTo(tile2.suit);
        } else {
          return tile1.rank.compareTo(tile2.rank);
        }
      });
  }

  @override
  bool checkTiles(List<Tile> tiles) {
    if (tiles.length < minMeldNum) {
      return false;
    }

    final rank = tiles.first.rank;
    for (var tile in tiles) {
      if (tile.rank != rank) {
        return false;
      }
    }

    final suits = tiles.map((e) => e.suit);
    if (suits.length != suits.toSet().length) {
      return false;
    }

    return true;
  }
}
