import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('Card', () {
    test('serialize', () {
      var card = Card(1, 2);
      String jsonString = jsonEncode(card);
      print(jsonString);
      expect(jsonString, equals('''"1,2"'''));

      var cardJson = jsonDecode(jsonString) as String;
      card = Card.fromJson(cardJson);
      print("$card");
      expect(card.rank, equals(1));
      expect(card.suit, equals(2));
    });

    test('hash', () {
      final card = Card(1, 2);
      final card2 = Card(1, 2);
      expect(card == card2, equals(true));

      final cards = {card, card2};
      expect(cards, equals({Card(1, 2)}));
    });
  });
}
