import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/melds/meld_type.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('Run', () {
    final rule = Run();

    test('serialize', () {
      // TODO
    });

    test('check - true', () {
      final cards = [Card(3, 1), Card(3, 2), Card(3, 3)];
      print(rule.checkCards(cards));
    });

    test('check - false', () {
      final cards = [Card(2, 2), Card(3, 1), Card(3, 2), Card(3, 3)];
      print(rule.checkCards(cards));
    });
  });
}
