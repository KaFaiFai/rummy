import 'dart:convert';

import 'package:rummy/rummy/const.dart';

import '../models/tile.dart';

part 'group.dart';

part 'run.dart';

sealed class Meld {
  Meld();

  /// arrange tiles in desired order
  List<Tile> arrangeTiles(List<Tile> tiles);

  /// check if the tiles belong to this type
  bool checkTiles(List<Tile> tiles);

  @override
  String toString() {
    return runtimeType.toString();
  }

  factory Meld.fromJson(Map<String, dynamic> json) {
    return switch (json["_class"]) {
      "Run" => Run(),
      "Group" => Group(),
      _ => throw 'Invalid Meld type',
    };
  }

  Map<String, dynamic> toJson() {
    return {'_class': toString()};
  }

  @override
  int get hashCode {
    return Object.hash(toString(), jsonEncode(toJson()));
  }

  @override
  bool operator ==(Object other) {
    if (other is Meld) {
      return (jsonEncode(toJson())) == jsonEncode(other.toJson());
    }
    return false;
  }
}
