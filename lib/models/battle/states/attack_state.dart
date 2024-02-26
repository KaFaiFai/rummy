import 'package:rummy/models/battle/battle_data.dart';

import 'base.dart';

class AttackState extends BattleState {
  @override
  void begin(BattleData battleData) {
    battleData.hero.attack(battleData.enemies.first);
    battleData.enemies.removeWhere((e) => e.curHP <= 0);
  }

  @override
  void end(BattleData battleData) {
    for (var e in battleData.enemies) {
      e.attack(battleData.hero);
    }
  }
}
