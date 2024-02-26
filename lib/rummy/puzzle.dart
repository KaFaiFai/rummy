// reference: https://en.wikipedia.org/wiki/Rummy
import 'melds/meld.dart';
import 'tile.dart';

class Puzzle {
  final List<Meld> melds;
  final List<(Meld, List<Tile>)> solution;
  final List<(Meld, List<Tile>)> meldTiles;
  final List<Tile> hands;

  Puzzle(this.melds, this.solution, this.meldTiles, this.hands) {
    for (var (meld, tiles) in solution) {
      assert(melds.contains(meld), "Unknown meldTile ${(meld, tiles)} in $melds");
      assert(meld.checkTiles(tiles), "meldTile mismatch ${(meld, tiles)}");
    }
    for (var (meld, tiles) in meldTiles) {
      assert(melds.contains(meld), "Unknown meldTile ${(meld, tiles)} in $melds");
      assert(meld.checkTiles(tiles), "meldTile mismatch ${(meld, tiles)}");
    }
    final solutionTiles = solution.expand((e) => e.$2).toList();
    final puzzleTiles = meldTiles.expand((e) => e.$2).toList() + hands;

    final extraSolutionTiles = [...solutionTiles];
    for (var tile in puzzleTiles) {
      extraSolutionTiles.remove(tile);
    }
    assert(extraSolutionTiles.isEmpty, "Extra solution tiles: $extraSolutionTiles");

    final extraPuzzleTiles = [...puzzleTiles];
    for (var tile in puzzleTiles) {
      extraPuzzleTiles.remove(tile);
    }
    assert(extraPuzzleTiles.isEmpty, "Extra puzzle tiles: $extraPuzzleTiles");
  }

  @override
  String toString() {
    return "Melds: $melds\nSolution:$solution\nTiles: $meldTiles\nHands: $hands";
  }
}
