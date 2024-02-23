import 'package:flutter/material.dart';
import 'package:rummy/view/with_app_container.dart';

import '../../rummy/models/tile.dart';

void main() {
  runWithAppContainer(
    TileCard(tile: Tile(1, 2)),
    title: "TileCard",
  );
}

class TileCard extends StatelessWidget {
  final Tile tile;

  const TileCard({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text(tile.toString())),
    );
  }
}
