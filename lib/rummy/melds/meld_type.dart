import '../models/card.dart';

part 'group.dart';

part 'run.dart';

sealed class MeldType {
  MeldType();

  /// arrange cards in desired order
  List<Card> arrangeCards(List<Card> cards);

  /// check if the cards belong to this type
  bool checkCards(List<Card> cards);

  String name() {
    return runtimeType.toString();
  }

  factory MeldType.fromJson(Map<String, dynamic> json) {
    return switch (json["_class"]) {
      "Run" => Run(),
      "Group" => Group(),
      _ => throw 'Invalid Rule type',
    };
  }

  Map<String, dynamic> toJson() {
    return {'_class': name()};
  }
}
