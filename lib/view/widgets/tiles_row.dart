import 'package:flutter/material.dart';
import 'package:rummy/view/widgets/tile_card.dart';

import '../../rummy/tile.dart';

class TilesRow extends StatelessWidget {
  final List<Tile> tiles;

  const TilesRow({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: tiles.map((e) => TileCard(tile: e)).toList(),
    );
  }
}
