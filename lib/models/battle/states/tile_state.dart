import 'package:rummy/models/battle/battle_data.dart';

import 'base.dart';

class TileState extends BattleState {
  @override
  void begin(BattleData battleData) {
    battleData.slottedMeldTiles.clear();
    battleData.drawTiles();
  }

  @override
  void update(BattleData battleData) {
    // check meld type
    for (var (i, meldTile) in battleData.slottedMeldTiles.indexed) {
      if (meldTile.$1 == null) {
        for (var meld in battleData.melds) {
          if (meld.checkTiles(meldTile.$2)) {
            battleData.slottedMeldTiles[i] = (meld, meldTile.$2);
          }
        }
      }
    }
  }

  @override
  void end(BattleData battleData) {}
}
