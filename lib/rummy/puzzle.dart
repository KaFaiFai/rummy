// reference: https://en.wikipedia.org/wiki/Rummy
import 'melds/meld.dart';
import 'models/card.dart';

class Puzzle {
  final List<Meld> melds;
  final List<(Meld, List<Card>)> intendedSolution;
  final List<(Meld, List<Card>)> meldCards;
  final List<Card> hands;

  Puzzle(this.melds, this.intendedSolution, this.meldCards, this.hands) {
    for (var (meld, cards) in intendedSolution) {
      assert(melds.contains(meld), "Unknown meldCard ${(meld, cards)} in $melds");
      assert(meld.checkCards(cards), "meldCard mismatch ${(meld, cards)}");
    }
    for (var (meld, cards) in meldCards) {
      assert(melds.contains(meld), "Unknown meldCard ${(meld, cards)} in $melds");
      assert(meld.checkCards(cards), "meldCard mismatch ${(meld, cards)}");
    }
    final solutionCards = intendedSolution.expand((e) => e.$2).toList();
    final puzzleCards = meldCards.expand((e) => e.$2).toList() + hands;
    assert(solutionCards.every((e) => puzzleCards.contains(e)),
        "Extra solution cards: ${solutionCards.where((e) => !puzzleCards.contains(e))}");
    assert(puzzleCards.every((e) => solutionCards.contains(e)),
        "Extra puzzle cards: ${puzzleCards.where((e) => !solutionCards.contains(e))}");
  }

  @override
  String toString() {
    return "Melds: $melds\nIntended solution:$intendedSolution\nCards: $meldCards\nHands: $hands";
  }
}
