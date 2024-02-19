import '../models/card.dart';

part 'group.dart';

part 'run.dart';

sealed class MeldType {
  /// arrange cards in desired order
  List<Card> arrangeCards(List<Card> cards);

  /// check if the cards belong to this type
  bool checkCards(List<Card> cards);
}
