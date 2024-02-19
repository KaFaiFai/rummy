part of 'meld.dart';

class Run extends Meld {
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
    final cardsSorted = arrangeCards(cards);

    final suit = cardsSorted.first.suit;
    final begin = cardsSorted.first.rank;

    for (var (i, card) in cardsSorted.indexed) {
      final cardExpected = Card(begin + i, suit);
      if (card != cardExpected) {
        return false;
      }
    }
    return true;
  }
}
