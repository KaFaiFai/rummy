import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('similarity', () {
    test('same', () {
      final cards1 = [Card(3, 1), Card(3, 2), Card(3, 3)];
      final cards2 = [Card(3, 1), Card(3, 2), Card(3, 3)];
      final similarity = RummyAi.similarity(cards1, cards2);
      expect(similarity, equals(1));
    });

    test('similar', () {
      final cards1 = [Card(3, 0), Card(3, 1), Card(3, 2), Card(3, 3)];
      final cards2 = [Card(2, 2), Card(3, 1), Card(3, 2), Card(3, 3)];
      final similarity = RummyAi.similarity(cards1, cards2);
      expect(similarity, equals(6 / 8));
    });

    test('different', () {
      final cards1 = [Card(3, 1), Card(3, 2), Card(3, 3)];
      final cards2 = [Card(2, 1), Card(2, 2), Card(2, 3)];
      final similarity = RummyAi.similarity(cards1, cards2);
      expect(similarity, equals(0));
    });
  });
}
