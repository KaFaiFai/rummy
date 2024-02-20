part of 'rummy_ai.dart';

extension on Meld {
  /// helper function for getRandomSample()
  /// sometimes, it does not make sense to implement this function
  List<List<Card>> getAllPossibleSamples(List<Card> cards) {
    switch (this) {
      case Run():
        final List<List<Card>> runs = [];
        for (var i = 0; i < numSuit; i++) {
          // unique cards of current suit
          final suit = cards.where((e) => e.suit == i).toSet().toList();
          suit.sort();

          if (suit.length > 1) {
            List<Card> run = [suit.first];
            for (var i = 1; i < suit.length; i++) {
              if (suit[i].rank == run.last.rank + 1) {
                run.add(suit[i]);
              } else {
                if (run.length >= minMeldNum) {
                  runs.add(run);
                  run = [];
                }
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
        final suits = List.generate(numRank, (i) => cards.where((e) => e.rank == i).toSet().toList());
        final availableSuits = suits.where((e) => e.length >= minMeldNum).toList();
        return availableSuits;
    }
  }
}
