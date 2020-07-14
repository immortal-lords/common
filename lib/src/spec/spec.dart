import 'package:meta/meta.dart';

export 'building.dart';
export 'warrior.dart';
export 'position.dart';
export 'resource.dart';

const numColsInCity = 15;
const numRowsInCity = 15;

final int ccPosX = numColsInCity ~/ 2;
final int ccPosY = numRowsInCity ~/ 2;

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

class CityEntityKind {
  final String name;

  const CityEntityKind._({@required this.name});

  static CityEntityKind fromName(String name) {
    switch (name) {
      case 'EMPTY':
        return empty;
      case 'FOREST':
        return forest;
      case 'HILL':
        return hill;
      case 'MOUNTAIN':
        return mountain;
      case 'LOOKNFEEL':
        return lookNFeel;
      case 'DECORATIVE':
        return decorative;
      case 'BUILDING':
        return building;
      case 'TOWER':
        return tower;
      case 'ENEMY':
        return enemy;
      default:
        return null;
    }
  }

  static const empty = CityEntityKind._(name: 'EMPTY');

  static const forest = CityEntityKind._(name: 'FOREST');

  static const hill = CityEntityKind._(name: 'HILL');

  static const mountain = CityEntityKind._(name: 'MOUNTAIN');

  static const lookNFeel = CityEntityKind._(name: 'LOOKNFEEL');

  static const decorative = CityEntityKind._(name: 'DECORATIVE');

  static const building = CityEntityKind._(name: 'BUILDING');

  static const tower = CityEntityKind._(name: 'TOWER');

  static const enemy = CityEntityKind._(name: 'ENEMY');
}

class Level20List<T> {
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
  final T level11;
  final T level12;
  final T level13;
  final T level14;
  final T level15;
  final T level16;
  final T level17;
  final T level18;
  final T level19;
  final T level20;

  const Level20List(
      {this.level1,
      this.level2,
      this.level3,
      this.level4,
      this.level5,
      this.level6,
      this.level7,
      this.level8,
      this.level9,
      this.level10,
      this.level11,
      this.level12,
      this.level13,
      this.level14,
      this.level15,
      this.level16,
      this.level17,
      this.level18,
      this.level19,
      this.level20});

  const Level20List.make(
      this.level1,
      this.level2,
      this.level3,
      this.level4,
      this.level5,
      this.level6,
      this.level7,
      this.level8,
      this.level9,
      this.level10,
      this.level11,
      this.level12,
      this.level13,
      this.level14,
      this.level15,
      this.level16,
      this.level17,
      this.level18,
      this.level19,
      this.level20);

  const Level20List.same(T value)
      : level1 = value,
        level2 = value,
        level3 = value,
        level4 = value,
        level5 = value,
        level6 = value,
        level7 = value,
        level8 = value,
        level9 = value,
        level10 = value,
        level11 = value,
        level12 = value,
        level13 = value,
        level14 = value,
        level15 = value,
        level16 = value,
        level17 = value,
        level18 = value,
        level19 = value,
        level20 = value;

  T operator [](int index) {
    switch (index) {
      case 1:
        return level1;
      case 2:
        return level2;
      case 3:
        return level3;
      case 4:
        return level4;
      case 5:
        return level5;
      case 6:
        return level6;
      case 7:
        return level7;
      case 8:
        return level8;
      case 9:
        return level9;
      case 10:
        return level10;
      case 11:
        return level11;
      case 12:
        return level12;
      case 13:
        return level13;
      case 14:
        return level14;
      case 15:
        return level15;
      case 16:
        return level16;
      case 17:
        return level17;
      case 18:
        return level18;
      case 19:
        return level19;
      case 20:
        return level20;
      default:
        throw RangeError.index(index, this);
    }
  }
}
