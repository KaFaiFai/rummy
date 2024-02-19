import 'package:rummy/rummy/const.dart';

class Card {
  final int rank;
  final int suit;

  Card(this.rank, this.suit) {
    assert(rank < numRank);
    assert(suit < numSuit);
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
}
