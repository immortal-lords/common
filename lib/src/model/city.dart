import 'package:meta/meta.dart';

import 'package:common/common.dart';

abstract class CityEntity {
  Position get position;

  String get kind;

  bool isEqual(CityEntity other);

  dynamic toJson();

  static CityEntity fromMap(Map map) {
    final kind = map['kind'];
    if (kind == null) {
      throw Exception('kind cannot be null');
    }

    switch (kind) {
      case 'TERRAIN':
        return CityTerrain.fromMap(map);
      case 'BUILDING':
        return Building.fromMap(map);
      default:
        throw Exception('unknown city entity kind: $kind');
    }
  }
}

class CityTerrain implements CityEntity {
  @override
  final Position position;

  final String type;

  @override
  final String kind = 'TERRAIN';

  CityTerrain({@required this.position, @required this.type});

  @override
  bool isEqual(final CityEntity other) {
    if (other is! CityTerrain) {
      return false;
    }

    if (other is CityTerrain) {
      if (position != other.position) {
        return false;
      }

      if (type != other.type) {
        return false;
      }

      return true;
    }
  }

  static CityTerrain fromMap(Map map) => CityTerrain(
      position: Position.fromString(map['position']), type: map['type']);

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'position': position.toJson(),
        'kind': kind,
      };
}

class Building implements CityEntity {
  final int id;

  final int type;

  @override
  final Position position;

  final int level;

  @override
  final String kind = 'BUILDING';

  Building(
      {@required this.id,
      @required this.type,
      @required this.position,
      @required this.level});

  @override
  bool isEqual(final CityEntity other) {
    if (other is! Building) {
      return false;
    }

    if (other is Building) {
      if (id != other.id) {
        return false;
      }

      if (position != other.position) {
        return false;
      }

      if (type != other.type) {
        return false;
      }

      if (level != other.level) {
        return false;
      }

      return true;
    }
  }

  static Building fromMap(Map map) => Building(
      id: map['id'],
      type: map['type'],
      position: Position.fromString(map['position']),
      level: map['level']);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'position': position.toJson(),
        'level': level,
        'kind': kind,
      };
}

class City {
  final int id;

  final String name;

  final Map<Position, CityEntity> children;

  final LazyResource resources;

  City(
      {@required this.id,
      @required this.name,
      @required this.children,
      @required this.resources});

  @override
  String toString() => toJson().toString();

  static City fromMap(Map map) => City(
      id: map['id'],
      name: map['name'],
      children: (map['children'] as Map).map((key, value) =>
          MapEntry(Position.fromString(key), CityEntity.fromMap(value))),
      resources: LazyResource.fromMap(map['resources']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'children': children
            .map((key, value) => MapEntry(key.toJson(), value.toJson())),
        'resources': resources.toJson(),
      };
}
