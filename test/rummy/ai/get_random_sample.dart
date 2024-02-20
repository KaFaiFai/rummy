import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('getRandomSample', () {
    final cards = Card.getAllCards();

    test('run', () {
      final sample = RummyAi.getRandomSample(cards, Run(), random: Random(0));
      print(sample);
    });

    test('group', () {});
  });
}
