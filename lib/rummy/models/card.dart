import 'package:rummy/rummy/const.dart';

class Card implements Comparable<Card> {
  final int rank;
  final int suit;

  Card(this.rank, this.suit) {
    assert(rank < numRank);
    assert(suit < numSuit);
  }

  static List<Card> getAllCards() {
    final cards = List.generate(numRank * numSuit, (i) => Card(i % 13, (i / 13).floor()));
    return cards;
  }

  @override
  String toString() {
    return "Card($rank,$suit)";
  }

  @override
  int get hashCode {
    return Object.hash(rank, suit);
  }

  @override
  bool operator ==(Object other) {
    if (other is Card) {
      return rank == other.rank && suit == other.suit;
    }
    return false;
  }

  factory Card.fromJson(String jsonString) {
    final components = jsonString.split(',');
    final rank = int.parse(components[0]);
    final suit = int.parse(components[1]);
    return Card(rank, suit);
  }

  String toJson() => "$rank,$suit";

  @override
  int compareTo(Card other) {
    // orders := (rank, suit)
    final compareRank = rank.compareTo(other.rank);
    if (compareRank != 0) {
      return compareRank;
    }
    return suit.compareTo(other.suit);
  }
}
