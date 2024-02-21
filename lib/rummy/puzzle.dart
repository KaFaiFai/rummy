// reference: https://en.wikipedia.org/wiki/Rummy
import 'melds/meld.dart';
import 'models/card.dart';

class Puzzle {
  final List<Meld> melds;
  final List<(Meld, List<Card>)> solution;
  final List<(Meld, List<Card>)> meldCards;
  final List<Card> hands;

  Puzzle(this.melds, this.solution, this.meldCards, this.hands) {
    for (var (meld, cards) in solution) {
      assert(melds.contains(meld), "Unknown meldCard ${(meld, cards)} in $melds");
      assert(meld.checkCards(cards), "meldCard mismatch ${(meld, cards)}");
    }
    for (var (meld, cards) in meldCards) {
      assert(melds.contains(meld), "Unknown meldCard ${(meld, cards)} in $melds");
      assert(meld.checkCards(cards), "meldCard mismatch ${(meld, cards)}");
    }
    final solutionCards = solution.expand((e) => e.$2).toList();
    final puzzleCards = meldCards.expand((e) => e.$2).toList() + hands;

    final extraSolutionCards = [...solutionCards];
    for (var card in puzzleCards) {
      extraSolutionCards.remove(card);
    }
    assert(extraSolutionCards.isEmpty, "Extra solution cards: $extraSolutionCards");

    final extraPuzzleCards = [...puzzleCards];
    for (var card in puzzleCards) {
      extraPuzzleCards.remove(card);
    }
    assert(extraPuzzleCards.isEmpty, "Extra puzzle cards: $extraPuzzleCards");
  }

  @override
  String toString() {
    return "Melds: $melds\nSolution:$solution\nCards: $meldCards\nHands: $hands";
  }
}
