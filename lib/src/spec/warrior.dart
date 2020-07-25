import 'package:common/common.dart';
import 'package:meta/meta.dart';

class WarriorSpec {
  final int type;

  final String name;

  final String description;

  final AttackType attackType;

  final Level20List<int> armor;

  final Level20List<int> pierceArmor;

  final Level20List<int> hp;

  final Level20List<int> damage;

  final Level20List<ConstResource> recruitmentCost;

  final Level20List<Duration> recruitmentDuration;

  final int minBarrackLevel;

  final int troopSpace;

  const WarriorSpec({
    @required this.type,
    @required this.name,
    @required this.description,
    @required this.attackType,
    @required this.armor,
    @required this.pierceArmor,
    @required this.hp,
    @required this.damage,
    @required this.recruitmentCost,
    @required this.recruitmentDuration,
    @required this.minBarrackLevel,
    @required this.troopSpace,
  });

  String get css => name.replaceAll(' ', '-').toLowerCase();

  static const berserkerId = 0;

  static const archerId = 1;

  static const specs = [
    berserker,
    archer,
  ];

  static WarriorSpec byType(int type, {bool throws = true}) {
    switch (type) {
      case berserkerId:
        return berserker;
      case archerId:
        return archer;
      default:
        if(!throws) {
          return null;
        }
        throw Exception('unknown warrior type $type');
    }
  }

  static const berserker = WarriorSpec(
    type: berserkerId,
    name: 'Berserker',
    description: '''Berserker''',
    recruitmentCost: Level20List.same(ConstResource(wood: 10)),
    recruitmentDuration: Level20List.same(Duration(minutes: 1)),
    attackType: AttackType.pierce,
    damage: Level20List.same(10),
    hp: Level20List.same(100),
    armor: Level20List.same(10),
    pierceArmor: Level20List.same(10),
    minBarrackLevel: 1,
    troopSpace: 1,
  );

  static const archer = WarriorSpec(
    type: archerId,
    name: 'Archer',
    description: '''Archer''',
    recruitmentCost: Level20List.same(ConstResource(wood: 10)),
    recruitmentDuration: Level20List.same(Duration(minutes: 1)),
    attackType: AttackType.pierce,
    damage: Level20List.same(10),
    hp: Level20List.same(100),
    armor: Level20List.same(10),
    pierceArmor: Level20List.same(10),
    minBarrackLevel: 1,
    troopSpace: 1,
  );
}
