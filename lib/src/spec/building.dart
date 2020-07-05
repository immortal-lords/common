import 'package:common/common.dart';
import 'package:meta/meta.dart';

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

class BuildingSpec {
  final int type;

  final String name;

  final String description;

  final AttackType attackType;

  final Level10List<int> armor;

  final Level10List<int> pierceArmor;

  final Level10List<int> hp;

  final Level10List<ConstResource> constructionCost;

  final Level10List<Duration> constructionDuration;

  final Level10List<int> production1;

  final Level10List<int> production2;

  const BuildingSpec({
    @required this.type,
    @required this.name,
    @required this.description,
    @required this.attackType,
    @required this.armor,
    @required this.pierceArmor,
    @required this.hp,
    @required this.constructionCost,
    @required this.constructionDuration,
    @required this.production1,
    @required this.production2,
  });

  static BuildingSpec byType(int type) {
    switch (type) {
      case 0:
        return lumberCamp;
      case 1:
        return quarry;
    }
    // TODO
  }

  static const lumberCamp = BuildingSpec(
    type: 0,
    name: 'Lumber camp',
    description: '',
    armor: Level10List.same(10),
    pierceArmor: Level10List.same(10),
    hp: Level10List.same(100),
    constructionCost: Level10List(
      level1: ConstResource(wood: 100),
      level2: ConstResource(wood: 100),
      level3: ConstResource(wood: 100),
      level4: ConstResource(wood: 100),
      level5: ConstResource(wood: 100),
      level6: ConstResource(wood: 100),
      level7: ConstResource(wood: 100),
      level8: ConstResource(wood: 100),
      level9: ConstResource(wood: 100),
      level10: ConstResource(wood: 100),
    ),
    constructionDuration: Level10List(
      level1: Duration(minutes: 1),
      level2: Duration(minutes: 1),
      level3: Duration(minutes: 1),
      level4: Duration(minutes: 1),
      level5: Duration(minutes: 1),
      level6: Duration(minutes: 1),
      level7: Duration(minutes: 1),
      level8: Duration(minutes: 1),
      level9: Duration(minutes: 1),
      level10: Duration(minutes: 1),
    ),
  );

  static const quarry = BuildingSpec(
      type: 1,
      name: 'Quarry',
      description: '',
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const goldMine = BuildingSpec(
      type: 2,
      name: 'Gold mine',
      description: '',
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const warehouse = BuildingSpec(
      type: 3,
      name: 'Warehouse',
      description: '',
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const barracks = BuildingSpec(
      type: 4,
      name: 'Barracks',
      description: '',
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const sanctum = BuildingSpec(
      type: 5,
      name: 'Sanctum',
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);
}
