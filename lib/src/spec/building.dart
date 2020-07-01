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
    name: null,
    description: null,
    armor: Level10List.same(10),
    pierceArmor: Level10List.same(10),
    hp: Level10List.same(100),
    constructionCost: Level10List.same(ConstResource(wood: 1)),
    constructionDuration: Level10List.same(Duration(minutes: 1)),
  );

  static const quarry = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const mine = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const houses = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const barracks = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const sanctum = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const fort = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);

  static const outpost = BuildingSpec(
      type: null,
      name: null,
      description: null,
      armor: null,
      pierceArmor: null,
      hp: null,
      constructionCost: null);
}
