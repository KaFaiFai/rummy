part of 'meld.dart';

/// three or more consecutive pairs, e.g. 1♡, 1♣, 2♡, 2♢, 3♢, 3♡
class Pairs extends Meld {
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

    final ranksAppeared = tiles.map((e) => e.rank).toSet().toList()..sort();
    final begin = ranksAppeared.first;
    for (var (i, rank) in ranksAppeared.indexed) {
      if (rank != begin + i) {
        return false;
      }
      final tilesCurRank = tiles.where((e) => e.rank == rank).map((e) => e.suit);
      if (tilesCurRank.length != 2) {
        return false;
      }
    }
    return true;
  }
}
