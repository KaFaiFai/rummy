import 'package:rummy/rummy/util/const.dart';

class Tile {
  final int rank;
  final int suit;

  Tile(this.rank, this.suit) {
    assert(0 <= rank && rank < numRank);
    assert(0 <= suit && suit < numSuit);
  }

  static List<Tile> getAllTiles() {
    final tiles = List.generate(numRank * numSuit, (i) => Tile(i % 13, (i / 13).floor()));
    return tiles;
  }

  @override
  String toString() {
    const suitChars = '♠♡♣♢';
    return "${rank + 1}${suitChars[suit % 4]}";
  }

  @override
  int get hashCode {
    return Object.hash(rank, suit);
  }

  @override
  bool operator ==(Object other) {
    if (other is Tile) {
      return rank == other.rank && suit == other.suit;
    }
    return false;
  }

  factory Tile.fromJson(String jsonString) {
    final components = jsonString.split(',');
    final rank = int.parse(components[0]);
    final suit = int.parse(components[1]);
    return Tile(rank, suit);
  }

  String toJson() => "$rank,$suit";
}
