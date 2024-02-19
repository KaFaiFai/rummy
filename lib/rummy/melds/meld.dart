import 'package:rummy/rummy/const.dart';

import '../models/card.dart';

part 'group.dart';
part 'run.dart';

sealed class Meld {
  Meld();

  /// arrange cards in desired order
  List<Card> arrangeCards(List<Card> cards);

  /// check if the cards belong to this type
  bool checkCards(List<Card> cards);

  String name() {
    return runtimeType.toString();
  }

  factory Meld.fromJson(Map<String, dynamic> json) {
    return switch (json["_class"]) {
      "Run" => Run(),
      "Group" => Group(),
      _ => throw 'Invalid Meld type',
    };
  }

  Map<String, dynamic> toJson() {
    return {'_class': name()};
  }
}
