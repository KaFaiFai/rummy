import 'package:rummy/models/battle/states/attack_state.dart';
import 'package:rummy/models/battle/states/base.dart';
import 'package:rummy/models/battle/states/tile_state.dart';

import 'battle_data.dart';

class BattleStateMachine {
  static final _states = [TileState(), AttackState()];
  BattleState curState = _states.first;
  BattleData data;
  int curRound = 0;

  BattleStateMachine(this.data);

  void begin() {
    curState.begin(data);
  }

  void end() {
    curState.end(data);
  }

  void toNextState() {
    curState = _states[(_states.indexOf(curState) + 1) % 3];
  }
}
