import 'package:flutter/material.dart';
import 'package:rummy/view/widgets/tiles_row.dart';
import 'package:rummy/view/widgets/tiles_table.dart';

import '../../rummy/models/tile.dart';
import '../with_app_container.dart';

void main() {
  final tileSets = [
    [Tile(3, 3), Tile(4, 3), Tile(5, 3)],
    [Tile(3, 0), Tile(3, 1), Tile(3, 2)],
    [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)],
    [Tile(2, 2), Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)],
  ];
  final hands = [Tile(2, 2), Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)];
  runWithAppContainer(
    GameScreen(tileSets: tileSets, hands: hands),
    title: "TilesTable",
  );
}

class GameScreen extends StatelessWidget {
  final List<List<Tile>> tileSets;
  final List<Tile> hands;

  const GameScreen({super.key, required this.tileSets, required this.hands});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TilesTable(tileSets: tileSets),
          TilesRow(tiles: hands),
        ],
      ),
    );
  }
}
