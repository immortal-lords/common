import 'package:common/common.dart';
import 'package:meta/meta.dart';

class AttackType {
  final String name;

  const AttackType._(this.name);

  static const physical = AttackType._('PHYSICAL');

  static const pierce = AttackType._('PIERCE');

  // TODO static const magical = AttackType._('MAGICAL');
}

class TowerSpec {
  final int type;

  final String name;

  final String description;

  final Level20List<ConstResource> constructionCost;

  final Level20List<Duration> constructionDuration;

  final AttackType attackType;

  final Level20List<int> damage;

  final Level20List<int> hp;

  final Level20List<int> armor;

  final Level20List<int> pierceArmor;

  const TowerSpec({
    @required this.type,
    @required this.name,
    @required this.description,
    @required this.constructionCost,
    @required this.constructionDuration,
    @required this.attackType,
    @required this.damage,
    @required this.hp,
    @required this.armor,
    @required this.pierceArmor,
  });

  String get css => name.replaceAll(' ', '-').toLowerCase();

  static const wallId = 0;

  static const archerTowerId = 1;

  static const berserkerId = 10000;

  static const archerId = 10001;

  static TowerSpec anyByType(int type) {
    switch (type) {
      case wallId:
        return wall;
      case archerTowerId:
        return archerTower;
      case berserkerId:
        return berserker;
      case archerId:
        return archer;
      default:
        throw Exception('unknown tower type $type');
    }
  }

  static TowerSpec towerByType(int type) {
    switch (type) {
      case wallId:
        return wall;
      case archerTowerId:
        return archerTower;
      default:
        throw Exception('unknown tower type $type');
    }
  }

  static TowerSpec unitByType(int type) {
    switch (type) {
      case berserkerId:
        return berserker;
      case archerId:
        return archer;
      default:
        throw Exception('unknown tower type $type');
    }
  }

  static const wall = TowerSpec(
      type: wallId,
      name: 'Wall',
      description: '''Walls''',
      constructionCost: Level20List.same(ConstResource(stone: 100)),
      constructionDuration: Level20List.same(Duration(minutes: 1)),
      attackType: AttackType.physical,
      damage: Level20List.same(5),
      hp: Level20List.same(100),
      armor: Level20List.same(10),
      pierceArmor: Level20List.same(10));

  static const archerTower = TowerSpec(
      type: archerTowerId,
      name: 'Archer tower',
      description: '''Archer tower''',
      constructionCost: Level20List.same(ConstResource(stone: 100)),
      constructionDuration: Level20List.same(Duration(minutes: 1)),
      attackType: AttackType.pierce,
      damage: Level20List.same(10),
      hp: Level20List.same(100),
      armor: Level20List.same(10),
      pierceArmor: Level20List.same(10));

  static const berserker = TowerSpec(
      type: archerTowerId,
      name: 'Archer tower',
      description: '''Archer tower''',
      constructionCost: Level20List.same(ConstResource(stone: 100)),
      constructionDuration: Level20List.same(Duration(minutes: 1)),
      attackType: AttackType.pierce,
      damage: Level20List.same(10),
      hp: Level20List.same(100),
      armor: Level20List.same(10),
      pierceArmor: Level20List.same(10));

  static const archer = TowerSpec(
      type: archerTowerId,
      name: 'Archer tower',
      description: '''Archer tower''',
      constructionCost: Level20List.same(ConstResource(stone: 100)),
      constructionDuration: Level20List.same(Duration(minutes: 1)),
      attackType: AttackType.pierce,
      damage: Level20List.same(10),
      hp: Level20List.same(100),
      armor: Level20List.same(10),
      pierceArmor: Level20List.same(10));
}
