import 'dart:math';

import 'package:rummy/models/characters/enemy.dart';
import 'package:rummy/models/characters/hero.dart';
import 'package:rummy/rummy/tile.dart';

class BattleData {
  final Hero hero;
  final List<Enemy> enemies;
  final List<Tile> freeTiles;
  final List<List<Tile>> slottedTiles = [];
  final int maxSlots = 4;
  final int maxLength = 3;

  BattleData(this.hero, this.enemies, this.freeTiles);

  void drawTiles({int num = 4, Random? random}) {
    final tiles = Tile.getAllTiles()
      ..shuffle(random)
      ..sublist(0, num);
    freeTiles.addAll(tiles);
  }
}
