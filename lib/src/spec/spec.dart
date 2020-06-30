import 'package:meta/meta.dart';

export 'building.dart';
export 'warrior.dart';

const numColsInCity = 15;
const numRowsInCity = 15;

enum AttackType { none, melee, pierce }

class WorldMapTileKind {
  final String name;

  const WorldMapTileKind._(this.name);

  static const none = WorldMapTileKind._('NONE');
  static const forest = WorldMapTileKind._('FOREST');
  static const hill = WorldMapTileKind._('HILL');
  static const mountain = WorldMapTileKind._('MOUNTAIN');
  static const city = WorldMapTileKind._('CITY');

  static WorldMapTileKind fromName(String name) {
    switch (name) {
      case 'NONE':
        return none;
      case 'FOREST':
        return forest;
      case 'HILL':
        return hill;
      case 'MOUNTAIN':
        return mountain;
      case 'CITY':
        return city;
      default:
        throw Exception('unknown kind $name');
    }
  }
}

class Level10List<T> {
  final T level1;
  final T level2;
  final T level3;
  final T level4;
  final T level5;
  final T level6;
  final T level7;
  final T level8;
  final T level9;
  final T level10;

  const Level10List(
      {this.level1,
      this.level2,
      this.level3,
      this.level4,
      this.level5,
      this.level6,
      this.level7,
      this.level8,
      this.level9,
      this.level10});

  const Level10List.same(T value)
      : level1 = value,
        level2 = value,
        level3 = value,
        level4 = value,
        level5 = value,
        level6 = value,
        level7 = value,
        level8 = value,
        level9 = value,
        level10 = value;

  T operator [](int index) {
    switch (index) {
      case 0:
        return level1;
      case 1:
        return level2;
      case 2:
        return level3;
      case 3:
        return level4;
      case 4:
        return level5;
      case 5:
        return level6;
      case 6:
        return level7;
      case 7:
        return level8;
      case 8:
        return level9;
      case 9:
        return level10;
      default:
        throw RangeError.index(index, this);
    }
  }
}