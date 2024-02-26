import 'package:rummy/models/battle/battle_data.dart';

import 'base.dart';

class AttackState extends BattleState {
  @override
  void begin(BattleData battleData) {
    final meldTiles = battleData.slottedMeldTiles;
    battleData.hero.setDamage(meldTiles.length);
  }

  @override
  void update(BattleData battleData) {
    battleData.hero.attack(battleData.enemies.first);
    battleData.enemies.removeWhere((e) => e.curHP <= 0);

    for (var e in battleData.enemies) {
      e.attack(battleData.hero);
    }
  }

  @override
  void end(BattleData battleData) {
    battleData.hero.setDamage(0);
    battleData.hero.setShield(0);

    for (var e in battleData.enemies) {
      e.setDamage(0);
      e.setShield(0);
    }
  }
}
