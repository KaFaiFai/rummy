part of 'rummy_ai.dart';

extension on Meld {
  /// helper function for getRandomSample()
  /// sometimes, it does not make sense to implement this function
  List<List<Tile>> getSamplePools(List<Tile> tiles) {
    switch (this) {
      case Run():
        final runs = <List<Tile>>[];
        for (var i = 0; i < numSuit; i++) {
          // unique tiles of current suit
          final suit = arrangeTiles(tiles.where((e) => e.suit == i).toSet().toList());

          if (suit.length > 1) {
            List<Tile> run = [suit.first];
            for (var i = 1; i < suit.length; i++) {
              if (suit[i].rank == run.last.rank + 1) {
                run.add(suit[i]);
              } else {
                if (run.length >= minMeldNum) {
                  runs.add(run);
                }
                run = [suit[i]];
              }
            }
            if (run.length >= minMeldNum) {
              runs.add(run);
              run = [];
            }
          }
        }

        return runs;
      case Group():
        final suits = List.generate(numRank, (i) => tiles.where((e) => e.rank == i).toSet().toList());
        final availableSuits = suits.where((e) => e.length >= minMeldNum).toList();
        return availableSuits;
      case Pairs():
        List<List<Tile>> suits = List.generate(numRank, (i) => tiles.where((e) => e.rank == i).toList());
        suits = suits.where((e) => e.length >= 2).toList();
        final pairs = <List<Tile>>[];
        if (suits.isNotEmpty) {
          List<int> indices = [0];
          for (var i = 1; i < suits.length; i++) {
            if (suits[i].first.rank == suits[indices.last].first.rank + 1) {
              indices.add(i);
            } else {
              if (indices.length >= minMeldNum) {
                final curPairs = indices.map((e) => suits[e]).expand((e) => e).toList();
                pairs.add(curPairs);
              }
              indices = [i];
            }
          }
          if (indices.length >= minMeldNum) {
            final curPairs = indices.map((e) => suits[e]).expand((e) => e).toList();
            pairs.add(curPairs);
          }
        }

        return pairs;
    }
  }
}
