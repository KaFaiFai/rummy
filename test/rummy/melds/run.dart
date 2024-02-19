import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/melds/meld_type.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('Run', () {
    final meldType = Run();

    test('serialize', () {
      // TODO
    });

    test('arrange', () {
      final cardsInitial = [Card(2, 2), Card(3, 1), Card(3, 2), Card(3, 3)]..shuffle();
      final cardsArranged = meldType.arrangeCards(cardsInitial);
      print(cardsInitial);
      print(cardsArranged);
      expect(cardsArranged, equals([Card(2, 2), Card(3, 1), Card(3, 2), Card(3, 3)]));
    });

    test('check - true', () {
      final cards = [Card(3, 1), Card(4, 1), Card(5, 1)];
      expect(meldType.checkCards(cards), equals(true));
    });

    test('check - false', () {
      final cards = [Card(2, 2), Card(3, 1), Card(3, 2), Card(3, 3)];
      expect(meldType.checkCards(cards), equals(false));
    });
  });
}
