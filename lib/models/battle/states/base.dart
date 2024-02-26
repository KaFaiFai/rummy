import '../battle_data.dart';

abstract class BattleState {
  void onBegin(BattleData battleData);

  void onEnd(BattleData battleData);
}
