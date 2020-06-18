import 'package:meta/meta.dart';

import '../spec/spec.dart';

import 'package:collection/collection.dart';

export 'auth.dart';

int numRows = 100;
int numCols = 100;
int numTiles = numRows * numCols;

class LazyResource {
  final Resource resource;

  final Resource rate;

  final DateTime at;

  LazyResource(
      {@required this.resource, @required this.rate, @required this.at});

  factory LazyResource.fromMap(Map map) {
    if (map == null) return null;

    return LazyResource(
        resource: Resource.fromMap(map['resource']),
        rate: Resource.fromMap(map['rate']),
        at: DateTime.parse(map['at']));
  }

  LazyResource resourcesAt(DateTime newTime, {Resource newRate}) {
    if (newTime.isBefore(at)) {
      throw Exception('new time should be in future');
    }

    final duration = at.difference(newTime).inSeconds;
    return LazyResource(
        resource: resource + rate * duration,
        rate: newRate ?? rate,
        at: newTime);
  }

  bool hasEnough(ConstResource other) => resource > other;

  void subtract(ConstResource other) {
    resource.subtract(other);
  }

  String toPgsql() {
    return '(${resource.toPgsql()}, ${rate.toPgsql()}, ${at.toIso8601String()})::LazyResource';
  }
}

class BuildingTaskType {
  final int id;

  final String name;

  const BuildingTaskType._(this.id, this.name);

  static BuildingTaskType fromString(String task) {
    switch (task) {
      case 'NONE':
        return none;
      case 'UPGRADE':
        return upgrade;
      case 'RECRUIT':
        return recruit;
      default:
        if (task == null) return none;

        throw UnsupportedError('unknown task type: $task');
    }
  }

  static const none = BuildingTaskType._(0, 'NONE');
  static const upgrade = BuildingTaskType._(1, 'UPGRADE');
  static const recruit = BuildingTaskType._(2, 'RECRUIT');
}

class Alliance {
  final int id;

  final String name;

  Alliance({this.id, this.name});
}

class ResearchLevels extends DelegatingMap<int, int> {
  final Map<int, int> _map;

  ResearchLevels(this._map) : super(_map);

  factory ResearchLevels.fromHstoreMap(Map map) {
    final m = <int, int>{};

    for (final type in map.keys) {
      m[int.parse(type)] = int.parse(map[type]);
    }

    return ResearchLevels(m);
  }

  String get toPgHstore {
    return _map.keys.map((key) => '${key} => ${_map[key]}').join(', ');
  }
}

class ResearchInfo {
  final int technologyId;

  final DateTime completesAt;

  final Resource refund;

  ResearchInfo(
      {@required this.technologyId,
      @required this.completesAt,
      @required this.refund});

  factory ResearchInfo.fromMap(Map map) {
    if (map == null) return null;

    return ResearchInfo(
        technologyId: map['technologyId'],
        completesAt: map['completesAt'],
        refund: map['refund']);
  }
}

class Player {
  final int id;

  final String name;

  final String email;

  final String passwordHash;

  final LazyResource resource;

  final int maxBuildings;

  final int maxPopulation;

  final int numBuildings;

  final int numWarriors;

  final ResearchLevels researchLevels;

  final ResearchInfo researchInfo;

  Player({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.passwordHash,
    @required this.resource,
    @required this.maxBuildings,
    @required this.maxPopulation,
    @required this.numBuildings,
    @required this.numWarriors,
    @required this.researchLevels,
    @required this.researchInfo,
  });
}

class Position {
  int x;

  int y;

  Position.from1D(int pos) {
    // TODO
  }

  int to1D() => (y * numCols) + x;
}

class WorldMap {
  final Map<int, int> positions;

  WorldMap({this.positions});
}

abstract class MapUnit {
  int get id;

  Position get position;

  MapUnitSpec get spec;
}

abstract class PlayableUnit implements MapUnit {
  int get hpPercentage;

  int get level;

  int get playerId;

  int getArmor();

  int getPierceArmor();

  int getHp();

  int hpToPercentage(int value);

  int getArmorByAtackType(AttackType attackType) {
    switch (attackType) {
      case AttackType.none:
        return 0;
      case AttackType.melee:
        return getArmor();
      case AttackType.pierce:
        return getPierceArmor();
      default:
        throw Exception('unknown attack type');
    }
  }
}

class Building extends PlayableUnit {
  final int id;

  final Position position;

  final int type;

  final int playerId;

  final int level;

  final int hpPercentage;

  final DateTime constructionEnd;

  final BuildingTaskType taskType;

  Building(
      {@required this.id,
      @required this.position,
      @required this.type,
      @required this.playerId,
      @required this.level,
      @required this.hpPercentage,
      @required this.constructionEnd,
      @required this.taskType});

  @override
  BuildingSpec get spec => BuildingSpec.byType(type);

  @override
  int getArmor() {
    // TODO
  }

  @override
  int getPierceArmor() {
    // TODO
  }

  @override
  int getHp() {
    // TODO: implement getHp
    throw UnimplementedError();
  }

  @override
  int hpToPercentage(int value) {
    // TODO: implement hpToPercentage
    throw UnimplementedError();
  }
}

class Warrior extends PlayableUnit {
  final int id;

  final int type;

  final int playerId;

  final int level;

  final Position position;

  final DateTime lastMoved;

  final int hpPercentage;

  final int attacking;

  Warrior(
      {@required this.id,
      @required this.type,
      @required this.playerId,
      @required this.level,
      @required this.position,
      @required this.hpPercentage,
      @required this.lastMoved,
      @required this.attacking});

  WarriorSpec get spec => WarriorSpec.byType(type);

  @override
  int getArmor() {
    // TODO
  }

  @override
  int getPierceArmor() {
    // TODO
  }

  int damage() {
    // TODO
  }

  @override
  int getHp() {
    // TODO: implement getHp
    throw UnimplementedError();
  }

  @override
  int hpToPercentage(int value) {
    // TODO: implement hpToPercentage
    throw UnimplementedError();
  }
}

/*
class Terrain implements MapUnit {
  // TODO
}
 */