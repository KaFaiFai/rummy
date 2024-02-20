import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';
import 'package:rummy/rummy/models/card.dart';

void main() {
  group('getAllPossibleSamples', () {
    final cards = Card.getAllCards();

    test('run', () {
      final samples = RummyAi.getAllPossibleSamples(cards, Run());
      print(samples);
    });

    test('group', () {});
  });
}
