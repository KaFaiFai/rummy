import 'package:flutter/material.dart';
import 'package:rummy/view/widgets/tiles_row.dart';

import '../../rummy/tile.dart';
import '../with_app_container.dart';

void main() {
  final tileSets = [
    [Tile(3, 3), Tile(4, 3), Tile(5, 3)],
    [Tile(3, 0), Tile(3, 1), Tile(3, 2)],
    [Tile(2, 2), Tile(3, 1), Tile(3, 2), Tile(3, 3)],
    [Tile(2, 2), Tile(3, 0), Tile(3, 1), Tile(3, 2), Tile(3, 3)],
  ];
  runWithAppContainer(
    TilesTable(tileSets: tileSets),
    title: "TilesTable",
  );
}

class TilesTable extends StatelessWidget {
  final List<List<Tile>> tileSets;

  const TilesTable({super.key, required this.tileSets});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 10.0,
      spacing: 10.0,
      children: tileSets.map((e) => TilesRow(tiles: e)).toList(),
    );
  }
}
