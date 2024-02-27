import 'package:flutter/material.dart';
import 'package:rummy/view/widgets/tile_card.dart';

import '../../rummy/tile.dart';
import '../with_app_container.dart';

void main() {
  final tilesBoard = [
    [null, Tile(3, 3), Tile(4, 3), Tile(5, 3), null],
    [Tile(3, 0), Tile(3, 1), Tile(3, 2), null, null],
    [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3), null],
    [Tile(2, 2), Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)],
  ];
  runWithAppContainer(
    GameBoard(numRow: 4, numCol: 5, tilesBoard: tilesBoard),
    title: "GameBoard",
  );
}

class GameBoard extends StatelessWidget {
  final int numRow;
  final int numCol;
  final List<List<Tile?>> tilesBoard;

  const GameBoard({super.key, required this.tilesBoard, required this.numRow, required this.numCol});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade200,
      width: 600,
      child: GridView.count(
        crossAxisCount: numCol,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 5,
        children: List.generate(numRow * numCol, (index) {
          final curRow = (index / numCol).floor();
          final curCol = index % numCol;
          return TileCard(tile: tilesBoard[curRow][curCol]);
        }),
      ),
    );
  }
}
