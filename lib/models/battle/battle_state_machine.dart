import 'package:rummy/models/battle/states/base.dart';
import 'package:rummy/models/battle/states/enemy_state.dart';
import 'package:rummy/models/battle/states/free_state.dart';
import 'package:rummy/models/battle/states/hero_state.dart';

import 'battle_data.dart';

class BattleStateMachine {
  static final _states = [FreeState(), HeroState(), EnemyState()];
  BattleState curState = _states.first;
  BattleData data;
  int curRound = 0;

  BattleStateMachine(this.data);

  void begin() {
    curState.begin(data);
  }

  void update() {
    curState.update(data);
  }

  void end() {
    curState.end(data);
  }

  void toNextState() {
    curState = _states[(_states.indexOf(curState) + 1) % 3];
  }
}
