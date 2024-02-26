import 'dart:math';

import 'package:rummy/models/characters/enemy.dart';
import 'package:rummy/models/characters/superhero.dart';
import 'package:rummy/rummy/tile.dart';

import '../../rummy/melds/meld.dart';

class BattleData {
  final Superhero superhero;
  final List<Enemy> enemies;
  final List<Tile> freeTiles;
  final List<(Meld?, List<Tile>)> slottedMeldTiles = [];
  final List<Meld> melds;
  final int maxSlots = 4;
  final int maxLength = 3;

  BattleData(this.superhero, this.enemies, this.freeTiles, this.melds);

  void drawTiles({int num = 4, Random? random}) {
    final tiles = Tile.getAllTiles()
      ..shuffle(random)
      ..sublist(0, num);
    freeTiles.addAll(tiles);
  }
}
