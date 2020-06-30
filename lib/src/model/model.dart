import 'package:common/common.dart';
import 'package:meta/meta.dart';

import '../spec/spec.dart';

import 'package:collection/collection.dart';

export 'auth.dart';
export 'resource.dart';

class LazyResource {
  final Resource resource;

  final Resource rate;

  final Resource max;

  final DateTime at;

  LazyResource(
      {@required this.resource,
      @required this.rate,
      @required this.max,
      @required this.at});

  factory LazyResource.fromMap(Map map) {
    if (map == null) return null;

    return LazyResource(
        resource: Resource.fromMap(map['resource']),
        rate: Resource.fromMap(map['rate']),
        max: Resource.fromMap(map['max']),
        at: DateTime.parse(map['at']));
  }

  LazyResource resourcesAt(DateTime newTime, {Resource newRate}) {
    if (newTime.isBefore(at)) {
      throw Exception('new time should be in future');
    }

    final duration = newTime.difference(at).inSeconds;
    return LazyResource(
        resource: (resource + rate * duration)..limit(max),
        max: max,
        rate: newRate ?? rate,
        at: newTime);
  }

  bool hasEnough(ConstResource other) => resource > other;

  void subtract(ConstResource other) {
    resource.subtract(other);
  }
}

class BuildingTaskType {
  final int id;

  final String name;

  const BuildingTaskType._(this.id, this.name);

  String toJson() => name;

  static BuildingTaskType fromString(String task) {
    if (task == null) return none;

    switch (task) {
      case 'NONE':
        return none;
      case 'UPGRADE':
        return upgrade;
      case 'RECRUIT':
        return recruit;
      default:
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

  final int numCities;

  /*
  final ResearchLevels researchLevels;

  final ResearchInfo researchInfo;
   */

  Player({
    @required this.id,
    @required this.name,
    @required this.numCities,
    /*
    @required this.researchLevels,
    @required this.researchInfo,
     */
  });
}

class Position {
  int x;

  int y;

  Position({this.x = 0, this.y = 0});

  factory Position.fromString(String value) {
    if (!isValidPositionString(value)) {
      throw ArgumentError('invalid position string');
    }
    final parts = value.split(':').map((e) => int.parse(e));
    return Position(x: parts.elementAt(0), y: parts.elementAt(1));
  }

  factory Position.fromMap(Map map) =>
      Position(x: map['x'] ?? map['f0'], y: map['y'] ?? map['f1']);

  List<Position> getNeighbours() {
    final ret = <Position>[];

    for (int dx = -1; dx < 2; dx++) {
      for (int dy = -1; dy < 2; dy++) {
        final newX = x + dx;
        if (newX < 0) continue;

        final newY = y + dy;
        if (newY < 0) continue;

        if (newX == x && newY == y) continue;

        ret.add(Position(x: newX, y: newY));
      }
    }

    return ret;
  }

  String toJson() => toString();

  @override
  String toString() => '$x, $y';

  static RegExp positionStringRegExp = RegExp(r'^\d{1,5}:\d{1,5}$');
  static bool isValidPositionString(String value) {
    return positionStringRegExp.hasMatch(value);
  }
}

/*
abstract class PlayableUnit implements MapUnit {
  int get id;

  MapUnitSpec get spec;

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
 */

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

class CityEntity {
  final int cityId;

  final Position position;

  final CityEntityKind kind;

  final int tenantId;

  CityEntity({this.position, this.kind, this.cityId, this.tenantId});

  Map<String, dynamic> toJson() => {
        'cityId': cityId,
        'position': position.toJson(),
        // 'kind':
        'tenantId': tenantId,
      };
}

class Building implements CityEntity {
  @override
  final int id;

  final int cityId;

  @override
  final Position position;

  @override
  final CityEntityKind kind = CityEntityKind.building;

  final int type;

  final int level;

  final int hpPercentage;

  final DateTime constructionEnd;

  final BuildingTaskType taskType;

  Building(
      {@required this.id,
      @required this.cityId,
      @required this.position,
      @required this.type,
      @required this.level,
      @required this.hpPercentage,
      @required this.constructionEnd,
      @required this.taskType});

  @override
  int get tenantId => id;

  BuildingSpec get spec => BuildingSpec.byType(type);

  Map<String, dynamic> toJson() => {
        'id': id,
        'cityId': cityId,
        'position': position.toJson(),
        'level': level,
        'constructionEnd': constructionEnd?.toIso8601String(),
        'taskType': taskType?.toJson(),
      };

  /* TODO
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': position,
      'type': type,
      'playerId': playerId,
      'level': level,
    };
  }*/
}

/*
class Warrior extends PlayableUnit {
  @override
  final int id;

  final int type;

  @override
  final int playerId;

  @override
  final int level;

  @override
  final Position position;

  final DateTime lastMoved;

  @override
  final int hpPercentage;

  final int attacking;

  @override
  Kind get kind => Kind.warrior;

  Warrior(
      {@required this.id,
      @required this.type,
      @required this.playerId,
      @required this.level,
      @required this.position,
      @required this.hpPercentage,
      @required this.lastMoved,
      @required this.attacking});

  @override
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
 */
