import 'package:rummy/models/battle/battle_data.dart';

import 'base.dart';

class AttackState extends BattleState {
  @override
  void begin(BattleData battleData) {
    final meldTiles = battleData.slottedMeldTiles;
    battleData.superhero.setDamage(meldTiles.length);
  }

  @override
  void update(BattleData battleData) {
    battleData.superhero.attack(battleData.enemies.first);
    battleData.enemies.removeWhere((e) => e.curHP <= 0);

    for (var e in battleData.enemies) {
      e.attack(battleData.superhero);
    }
  }

  @override
  void end(BattleData battleData) {
    battleData.superhero.setDamage(0);
    battleData.superhero.setShield(0);

    for (var e in battleData.enemies) {
      e.setDamage(0);
      e.setShield(0);
    }
  }
}
