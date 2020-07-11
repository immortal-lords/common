import 'package:meta/meta.dart';

import 'package:common/common.dart';

abstract class CityEntity {
  Position get position;

  String get kind;

  bool isEqual(CityEntity other);

  dynamic toJson();

  bool get isTerrain;

  bool get isBuilding;

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
  bool get isTerrain => true;

  @override
  bool get isBuilding => false;

  String get css => type.toLowerCase();

  @override
  bool isEqual(final CityEntity other) {
    if (other is CityTerrain) {
      if (position != other.position) {
        return false;
      }

      if (type != other.type) {
        return false;
      }

      return true;
    } else {
      return false;
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

  final DateTime constructionStart;

  final DateTime constructionEnd;

  @override
  final String kind = 'BUILDING';

  final BuildingSpec spec;

  Building(
      {@required this.id,
      @required this.type,
      @required this.position,
      @required this.level,
      @required this.constructionStart,
      @required this.constructionEnd})
      : spec = BuildingSpec.byType(type);

  @override
  bool get isTerrain => false;

  @override
  bool get isBuilding => true;

  String get css => spec.name.replaceAll(' ', '-').toLowerCase();

  @override
  bool isEqual(final CityEntity other) {
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

      if (constructionStart != other.constructionStart) {
        return false;
      }

      if (constructionEnd != other.constructionEnd) {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }

  static Building fromMap(Map map) {
    DateTime constructionStart;
    if (map['constructionStart'] != null) {
      constructionStart = DateTime.parse(map['constructionStart']);
    }

    DateTime constructionEnd;
    if (map['constructionEnd'] != null) {
      constructionEnd = DateTime.parse(map['constructionEnd']);
    }

    return Building(
        id: map['id'],
        type: map['type'],
        position: Position.fromString(map['position']),
        level: map['level'],
        constructionStart: constructionStart,
        constructionEnd: constructionEnd);
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'position': position.toJson(),
        'level': level,
        'kind': kind,
        'constructionStart': constructionStart?.toUtc()?.toIso8601String(),
        'constructionEnd': constructionEnd?.toUtc()?.toIso8601String(),
      };
}

class City {
  final int id;

  final String name;

  final Position position;

  final Map<Position, CityEntity> children;

  final LazyResource resources;

  final int level;

  final int constructionSpeed;

  final int numBuildings;

  final int troopSpace;

  final int recruitmentSpeed;

  City({
    @required this.id,
    @required this.name,
    @required this.position,
    @required this.children,
    @required this.resources,
    @required this.level,
    @required this.constructionSpeed,
    @required this.numBuildings,
    @required this.troopSpace,
    @required this.recruitmentSpeed,
  });

  int get maxBuildings => level * 5;

  @override
  String toString() => toJson().toString();

  static City fromMap(Map map) => City(
        id: map['id'],
        name: map['name'],
        position: Position.fromString(map['position']),
        children: (map['children'] as Map).map((key, value) =>
            MapEntry(Position.fromString(key), CityEntity.fromMap(value))),
        resources: LazyResource.fromMap(map['resources']),
        level: map['level'],
        numBuildings: map['numBuildings'],
        constructionSpeed: map['constructionSpeed'],
        troopSpace: map['troopSpace'],
        recruitmentSpeed: map['recruitmentSpeed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'position': position.toJson(),
        'children': children
            .map((key, value) => MapEntry(key.toJson(), value.toJson())),
        'resources': resources.toJson(),
        'level': level,
        'numBuildings': numBuildings,
        'constructionSpeed': constructionSpeed,
        'troopSpace': troopSpace,
        'recruitmentSpeed': recruitmentSpeed,
      };
}
