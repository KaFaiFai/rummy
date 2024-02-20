import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rummy/rummy/melds/meld.dart';

void main() {
  group('Meld', () {
    test('serialize', () {
      Meld meld = Run();
      String jsonString = jsonEncode(meld);
      print(jsonString);
      expect(jsonString, equals('''{"_class":"Run"}'''));

      var meldJson = jsonDecode(jsonString) as Map<String, dynamic>;
      meld = Meld.fromJson(meldJson);
      print("$meld");
      expect(meld, isA<Run>());
    });

    test('hash', () {
      final meld1 = Run();
      final meld2 = Run();
      final meld3 = Group();
      expect(meld1 == meld2, equals(true));
      expect(meld1 == meld3, equals(false));

      final melds = {meld1, meld2, meld3};
      print(melds);
      expect(melds, equals({Run(), Group()}));
    });
  });
}
