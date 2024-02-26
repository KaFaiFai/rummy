import 'package:rummy/models/characters/enemy.dart';
import 'package:rummy/models/characters/hero.dart';

class BattleData {
  final Hero hero;
  final List<Enemy> enemies;

  BattleData(this.hero, this.enemies);
}
