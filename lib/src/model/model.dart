import 'package:common/common.dart';
import 'package:meta/meta.dart';

import '../spec/spec.dart';

import 'package:collection/collection.dart';

export 'auth.dart';
export '../spec/resource.dart';
export 'city.dart';
export 'player.dart';

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
