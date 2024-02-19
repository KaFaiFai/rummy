part of 'meld_type.dart';

class Group extends MeldType {
  @override
  List<Card> arrangeCards(List<Card> cards) {
    return [...cards]..sort((card1, card2) {
        // Sort by rank first, then suit
        if (card1.rank != card2.rank) {
          return card1.rank.compareTo(card2.rank);
        } else {
          return card1.suit.compareTo(card2.suit);
        }
      });
  }

  @override
  bool checkCards(List<Card> cards) {
    final rank = cards.first.rank;
    for (var card in cards) {
      if (card.rank != rank) {
        return false;
      }
    }

    final suits = cards.map((e) => e.suit);
    if (suits.length != suits.toSet().length) {
      return false;
    }

    return true;
  }
}
