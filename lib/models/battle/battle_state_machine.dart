import 'package:rummy/models/battle/states/base.dart';

import 'battle_data.dart';

class BattleStateMachine {
  BattleState curState;
  BattleData data;
  int curRound = 0;

  BattleStateMachine(this.curState, this.data);
}
