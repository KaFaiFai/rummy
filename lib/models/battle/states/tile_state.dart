import 'package:rummy/models/battle/battle_data.dart';

import 'base.dart';

class TileState extends BattleState {
  @override
  void begin(BattleData battleData) {
    battleData.slottedTiles.clear();
    battleData.drawTiles();
  }

  @override
  void update(BattleData battleData) {}

  @override
  void end(BattleData battleData) {}
}
