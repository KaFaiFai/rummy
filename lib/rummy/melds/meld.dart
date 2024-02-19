import '../models/card.dart';
import 'meld_type.dart';

class Meld {
  final List<Card> cards;
  final MeldType type;

  Meld(List<Card> cards, this.type) : cards = cards..sort() {
    assert(cards.length >= 3);
  }
}
