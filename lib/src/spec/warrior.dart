import 'package:common/common.dart';
import 'package:meta/meta.dart';

class WarriorSpec {
  final int type;

  final String name;

  final String description;

  final AttackType attackType;

  final bool isMythical;

  final Level10List<int> armor;

  final Level10List<int> pierceArmor;

  final Level10List<int> hp;

  final Level10List<int> damage;

  final Level10List<ConstResource> recruitmentCost;

  final Level10List<int> recruitmentDuration;

  const WarriorSpec(
      {@required this.type,
        @required this.name,
        @required this.description,
        @required this.attackType,
        @required this.isMythical,
        @required this.armor,
        @required this.pierceArmor,
        @required this.hp,
        @required this.damage,
        @required this.recruitmentCost,
        @required this.recruitmentDuration});

  static const maxLevels = 10;

  static WarriorSpec byType(int index) {
    switch (index) {
      case 0:
      // TODO
      default:
      // TODO
    }
  }

  static const militia = WarriorSpec(
      type: 0,
      name: 'Militia',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));

  static const archer = WarriorSpec(
      type: 1,
      name: 'Archer',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));

  static const paladin = WarriorSpec(
      type: 2,
      name: 'Paladin',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));

  static const halbadier = WarriorSpec(
      type: 4,
      name: 'Halbadier',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));

  static const mage = WarriorSpec(
      type: 4,
      name: 'Halbadier',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));

  static const warlock = WarriorSpec(
      type: 4,
      name: 'Halbadier',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));

  static const titan = WarriorSpec(
      type: 4,
      name: 'Halbadier',
      description: '',
      isMythical: false,
      armor: Level10List(
          level1: 0,
          level2: 1,
          level3: 2,
          level4: 3,
          level5: 4,
          level6: 5,
          level7: 6,
          level8: 7,
          level9: 8,
          level10: 9),
      pierceArmor: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      hp: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      damage: Level10List(
          level1: 0,
          level2: 0,
          level3: 0,
          level4: 0,
          level5: 0,
          level6: 0,
          level7: 0,
          level8: 0,
          level9: 0,
          level10: 0),
      recruitmentCost: Level10List(
          level1: ConstResource(wood: 10),
          level2: ConstResource(wood: 10),
          level3: ConstResource(wood: 10),
          level4: ConstResource(wood: 10),
          level5: ConstResource(wood: 10),
          level6: ConstResource(wood: 10),
          level7: ConstResource(wood: 10),
          level8: ConstResource(wood: 10),
          level9: ConstResource(wood: 10),
          level10: ConstResource(wood: 10)));
}