import 'package:common/common.dart';
import 'package:meta/meta.dart';

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

  final int minCCLevel;

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
    @required this.minCCLevel,
  });

  String get css => name.replaceAll(' ', '-').toLowerCase();

  static const wallId = 0;

  static const archerTowerId = 1;

  static const List<TowerSpec> towers = [
    wall,
    archerTower,
  ];

  static TowerSpec byType(int type) {
    switch (type) {
      case wallId:
        return wall;
      case archerTowerId:
        return archerTower;
      default:
        throw Exception('unknown tower type $type');
    }
  }

  static const wall = TowerSpec(
    type: wallId,
    name: 'Wall',
    description: '''This strong and heavily armored structure tank enemy attacks and provide cover for towers.''',
    constructionCost: Level20List.same(ConstResource(stone: 100)),
    constructionDuration: Level20List.same(Duration(minutes: 1)),
    attackType: AttackType.physical,
    damage: Level20List.same(5),
    hp: Level20List.same(100),
    armor: Level20List.same(10),
    pierceArmor: Level20List.same(10),
    minCCLevel: 1,
  );

  static const archerTower = TowerSpec(
    type: archerTowerId,
    name: 'Archer tower',
    description: '''A tall structure built of wood and stone that provides shelter, stability and a good angle to aim arrows upon attackers that threaten the city.''',
    constructionCost: Level20List.same(ConstResource(stone: 100)),
    constructionDuration: Level20List.same(Duration(minutes: 1)),
    attackType: AttackType.pierce,
    damage: Level20List.same(10),
    hp: Level20List.same(100),
    armor: Level20List.same(10),
    pierceArmor: Level20List.same(10),
    minCCLevel: 1,
  );
}
