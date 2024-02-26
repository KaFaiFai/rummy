import 'package:flutter/material.dart';
import 'package:rummy/models/battle/battle_data.dart';
import 'package:rummy/models/battle/battle_state_machine.dart';
import 'package:rummy/models/characters/base.dart';
import 'package:rummy/models/characters/enemy.dart';
import 'package:rummy/models/characters/superhero.dart';
import 'package:rummy/rummy/melds/meld.dart';

import '../../rummy/tile.dart';
import '../with_app_container.dart';

void main() {
  final battleData = BattleData(
    Superhero(10),
    [Enemy(3), Enemy(4)],
    [Tile(2, 2), Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)],
    [Run(), Group()],
  );
  runWithAppContainer(
    BattleScreen(battleStateMachine: BattleStateMachine(battleData)),
    title: "BattleScreen",
  );
}

class BattleScreen extends StatelessWidget {
  final BattleStateMachine battleStateMachine;

  const BattleScreen({super.key, required this.battleStateMachine});

  @override
  Widget build(BuildContext context) {
    final superhero = _CharacterWidget(character: battleStateMachine.data.superhero);
    final enemies =
        Column(children: battleStateMachine.data.enemies.map((e) => _CharacterWidget(character: e)).toList());

    final endTurnButton = ElevatedButton(
      onPressed: () {
        battleStateMachine.enterNextState();
      },
      child: const Text("Next turn"),
    );

    final tileSlots = <List<Widget>>[];
    final length = battleStateMachine.data.maxLength;
    int i = 0;
    while (i < battleStateMachine.data.maxSlots) {
      if (i % 2 == 0) {
        tileSlots.add([]);
      }
      final tiles = battleStateMachine.data.slottedMeldTiles.elementAtOrNull(i)?.$2 ?? [];
      tileSlots.last.add(_TileSlots(length: length, tiles: tiles));
    }
    final slotsGrid = Column(children: tileSlots.map((e) => Row(children: e)).toList());

    final tilesRow = Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 10.0,
      spacing: 10.0,
      children: battleStateMachine.data.freeTiles.map((e) => _TileCard(tile: e)).toList(),
    );

    return Column(
      children: [
        Row(children: [superhero, enemies]),
        endTurnButton,
        slotsGrid,
        tilesRow,
      ],
    );
  }
}

class _CharacterWidget extends StatelessWidget {
  final CharacterBase character;

  const _CharacterWidget({required this.character});

  @override
  Widget build(BuildContext context) {
    final color = (character is Superhero) ? Colors.yellow : Colors.red;
    return Column(
      children: [Container(width: 50, height: 50, color: color), Text("${character.curHP}/${character.maxHP}")],
    );
  }
}

class _TileSlots extends StatelessWidget {
  final int length;
  final List<Tile> tiles;

  const _TileSlots({required this.length, required this.tiles});

  @override
  Widget build(BuildContext context) {
    final tileWidgets = <Widget>[];
    for (var i = 0; i < length; i++) {
      tileWidgets.add(_TileCard(tile: tiles.elementAtOrNull(i)));
    }
    return Row(children: tileWidgets);
  }
}

class _TileCard extends StatelessWidget {
  final Tile? tile;

  const _TileCard({required this.tile});

  @override
  Widget build(BuildContext context) {
    String text = "";
    Color borderColor = Theme.of(context).colorScheme.outline;
    Color bgColor = Theme.of(context).colorScheme.outline;
    if (tile != null) {
      text = tile.toString();
      borderColor = Theme.of(context).colorScheme.onPrimaryContainer;
      bgColor = Colors.transparent;
    }
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text(text)),
    );
  }
}
