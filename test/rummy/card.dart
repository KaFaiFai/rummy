import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('Card', () {
    test('basic', () {
      var card = Card(1, 2);
      String jsonString = jsonEncode(card);
      print(jsonString);
      expect(jsonString, equals("""{"rank":1,"suit":2}"""));

      var cardJson = jsonDecode(jsonString) as Map<String, dynamic>;
      card = Card.fromJson(cardJson);
      print("$card");
      expect(card.rank, equals(1));
      expect(card.suit, equals(2));
    });
  });
}
