part of 'rummy_ai.dart';

extension on Meld {
  /// helper function for getRandomSample()
  /// sometimes, it does not make sense to implement this function
  List<List<Tile>> getSamplePools(List<Tile> tiles) {
    switch (this) {
      case Run():
        final List<List<Tile>> runs = [];
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
    }
  }
}
