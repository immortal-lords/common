import 'package:common/api.dart';
import 'package:meta/meta.dart';

import 'package:common/common.dart';

abstract class CityEntity {
  Position get position;

  bool isEqual(CityEntity other);

  dynamic toJson();

  bool get isIndustrialEntity;

  bool get isBattleFieldEntity;

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
      case 'TOWER':
        return Tower.fromMap(map);
      default:
        throw Exception('unknown city entity kind: $kind');
    }
  }
}

abstract class IndustrialEntity implements CityEntity {
  @override
  Position get position;

  String get kind;

  bool get isTerrain;

  bool get isBuilding;

  static IndustrialEntity fromMap(Map map) {
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

class CityTerrain implements IndustrialEntity {
  @override
  final Position position;

  final String type;

  @override
  final String kind = 'TERRAIN';

  CityTerrain({@required this.position, @required this.type});

  CityTerrainSpec get spec => CityTerrainSpec.getByType(type);

  @override
  final bool isIndustrialEntity = true;

  @override
  final bool isBattleFieldEntity = false;

  @override
  final bool isTerrain = true;

  @override
  final bool isBuilding = false;

  String get css => spec.css;

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

abstract class Buildable implements CityEntity {
  int get id;

  DateTime get constructionStart;

  DateTime get constructionEnd;

  bool get constructionHasFinished;
}

class Building implements IndustrialEntity, Buildable {
  @override
  final int id;

  final int type;

  @override
  final Position position;

  final int level;

  @override
  final DateTime constructionStart;

  @override
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
  final bool isIndustrialEntity = true;

  @override
  final bool isBattleFieldEntity = false;

  @override
  bool get isTerrain => false;

  @override
  bool get isBuilding => true;

  /*
  bool get canRefundConstruction {
    if (constructionStart == null) {
      return false;
    }

    return !constructionStart
        .isBefore(DateTime.now().toUtc().subtract(Duration(minutes: 1)));
  }
   */

  @override
  bool get constructionHasFinished {
    if (constructionEnd == null) return false;

    return constructionEnd.isBefore(DateTime.now().toUtc());
  }

  String get css => spec.css;

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

class BattleFieldEntityKind {
  final String kind;

  const BattleFieldEntityKind._(this.kind);

  static const tower = BattleFieldEntityKind._('TOWER');

  static const enemy = BattleFieldEntityKind._('ENEMY');
}

abstract class BattleFieldEntity implements CityEntity {
  @override
  Position get position;

  BattleFieldEntityKind get kind;

  static BattleFieldEntity fromMap(Map map) {
    switch (map['kind']) {
      case 'TOWER':
        return Tower.fromMap(map);
      // TODO enemy
      default:
        throw Exception('unknown battle field entity kind');
    }
  }
}

class Tower implements BattleFieldEntity, Buildable {
  @override
  final int id;

  @override
  final Position position;

  final int type;

  @override
  final DateTime constructionStart;

  @override
  final DateTime constructionEnd;

  final int level;

  final int hp;

  @override
  final BattleFieldEntityKind kind = BattleFieldEntityKind.tower;

  final TowerSpec spec;

  Tower(
      {@required this.id,
      @required this.position,
      @required this.type,
      @required this.constructionStart,
      @required this.constructionEnd,
      @required this.level,
      @required this.hp})
      : spec = TowerSpec.byType(type);

  @override
  final bool isIndustrialEntity = false;

  @override
  final bool isBattleFieldEntity = true;

  String get css => spec.css;

  int get fullHp => spec.hp[level];

  int get armor => spec.armor[level];

  int get pierceArmor => spec.pierceArmor[level];

  int get damage => spec.damage[level];

  @override
  bool get constructionHasFinished {
    if (constructionEnd == null) return false;

    return constructionEnd.isBefore(DateTime.now().toUtc());
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'position': position.toJson(),
        'type': type,
        'level': level,
        'hp': hp,
        'kind': kind.kind,
        'constructionStart': constructionStart?.toUtc()?.toIso8601String(),
        'constructionEnd': constructionEnd?.toUtc()?.toIso8601String(),
      };

  @override
  bool isEqual(CityEntity other) {
    if (other is Tower) {
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

      if (hp != other.hp) {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }

  static Tower fromMap(Map map) {
    DateTime constructionStart;
    if (map['constructionStart'] != null) {
      constructionStart = DateTime.parse(map['constructionStart']);
    }

    DateTime constructionEnd;
    if (map['constructionEnd'] != null) {
      constructionEnd = DateTime.parse(map['constructionEnd']);
    }

    return Tower(
      id: map['id'],
      position: Position.fromString(map['position']),
      type: map['type'],
      level: map['level'],
      hp: map['hp'],
      constructionStart: constructionStart,
      constructionEnd: constructionEnd,
    );
  }
}

/*
class BattleFieldEnemy implements BattleFieldEntity {
  final int id;

  final Position position;

  BattleFieldEnemy({this.id, this.position});
}*/

class City {
  final int id;

  final int version;

  final String name;

  final Position position;

  final Map<Position, CityEntity> children;

  final LazyResource resources;

  final int level;

  final int constructionSpeed;

  final int numBuildings;

  final int troopSpace;

  final int recruitmentSpeed;

  final List<Recruiting> recruiting;

  final List<Fighter> fighters;

  City({
    @required this.id,
    @required this.version,
    @required this.name,
    @required this.position,
    @required this.children,
    @required this.resources,
    @required this.level,
    @required this.constructionSpeed,
    @required this.numBuildings,
    @required this.troopSpace,
    @required this.recruitmentSpeed,
    @required this.recruiting,
    @required this.fighters,
  });

  int get maxBuildings => level * 5;

  List<CityEntity> getNeighbours(Position pos) {
    final ret = <CityEntity>[];

    for (int x = pos.x - 1; x <= pos.x + 1; x++) {
      if (x.isNegative) {
        continue;
      }

      for (int y = pos.y - 1; y <= pos.y + 1; y++) {
        if (y.isNegative) {
          continue;
        }

        if (x == pos.x && y == pos.y) {
          continue;
        }

        final curPos = Position(x: x, y: y);
        final entity = children[curPos];
        if (entity == null) {
          continue;
        }

        ret.add(entity);
      }
    }

    return ret;
  }

  @override
  String toString() => toJson().toString();

  static City fromMap(Map map) => City(
        id: map['id'],
        version: map['version'],
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
        recruiting: (map['recruiting'] as List)
            .cast<Map>()
            .map(Recruiting.fromMap)
            .toList(),
        fighters:
            (map['fighters'] as List).cast<Map>().map(Fighter.fromMap).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'version': version,
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
        'recruiting': recruiting.map((r) => r.toJson()).toList(),
        'fighters': fighters.map((r) => r.toJson()).toList(),
      };
}
