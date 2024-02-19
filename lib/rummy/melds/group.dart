part of 'meld.dart';

class Group extends Meld {
  @override
  List<Card> arrangeCards(List<Card> cards) {
    return [...cards]..sort((card1, card2) {
        // Sort by suit first, then rank
        if (card1.suit != card2.suit) {
          return card1.suit.compareTo(card2.suit);
        } else {
          return card1.rank.compareTo(card2.rank);
        }
      });
  }

  @override
  bool checkCards(List<Card> cards) {
    if (cards.length < minMeldNum) {
      return false;
    }

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
