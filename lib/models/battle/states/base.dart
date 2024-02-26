import '../battle_data.dart';

abstract class BattleState {
  void begin(BattleData battleData);

  void update(BattleData battleData);

  void end(BattleData battleData);
}
