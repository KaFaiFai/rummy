// reference: https://en.wikipedia.org/wiki/Rummy
import 'melds/meld.dart';
import 'models/card.dart';

class Puzzle {
  final List<Meld> melds;
  final List<(Meld, List<Card>)> meldCards;
  final List<Card> hands;

  Puzzle(this.melds, this.meldCards, this.hands) {
    for (var (meld, cards) in meldCards) {
      assert(melds.contains(meld), "Unknown meldCard ${(meld, cards)} in $melds");
      assert(meld.checkCards(cards), "meldCard mismatch ${(meld, cards)}");
    }
  }
}
