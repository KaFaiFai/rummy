import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/ai/rummy_ai.dart';
import 'package:rummy/rummy/melds/meld.dart';

void main() {
  group('generatePuzzle', () {
    test('all melds', () {
      final rnd = Random(1);
      final melds = [Run(), Group()];
      final puzzle = RummyAi.generatePuzzle(melds, random: rnd);
      print(puzzle);
    });
  });
}
