import 'package:meta/meta.dart';

enum AttackType { none, melee, pierce }

class Kind {
  final int id;

  final String name;

  const Kind._(this.id, this.name);

  static const terrain = Kind._(0, 'Terrain');
  static const building = Kind._(1, 'Building');
  static const warrior = Kind._(2, 'Warrior');
}

class ConstResource {
  final int wood;

  final int stone;

  final int gold;

  const ConstResource({this.wood = 0, this.stone = 0, this.gold = 0});

  Resource clone({int withWood, int withStone, int withGold}) => Resource(
      wood: withWood ?? wood,
      stone: withStone ?? stone,
      gold: withGold ?? gold);

  Resource operator +(value) {
    if (value is int) {
      return Resource(
          wood: wood + value, stone: stone + value, gold: gold + value);
    } else if (value is ConstResource) {
      return Resource(
          wood: wood + value.wood,
          stone: stone + value.stone,
          gold: gold + value.gold);
    } else {
      throw UnsupportedError('unsupported type');
    }
  }

  Resource operator *(int value) =>
      Resource(wood: wood * value, stone: stone * value, gold: gold * value);

  bool operator <(other) {
    if (other is int) {
      return wood < other || stone < other || gold < other;
    } else if (other is ConstResource) {
      return wood < other.wood || stone < other.stone || gold < other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  bool operator >(other) {
    if (other is int) {
      return wood > other || stone > other || gold > other;
    } else if (other is ConstResource) {
      return wood > other.wood || stone > other.stone || gold > other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }
}

class Resource implements ConstResource {
  @override
  int wood;

  @override
  int stone;

  @override
  int gold;

  Resource({this.wood = 0, this.stone = 0, this.gold = 0});

  factory Resource.fromMap(Map map) {
    if (map == null) return null;

    return Resource(
        wood: map['wood'] ?? 0,
        stone: map['stone'] ?? 0,
        gold: map['gold'] ?? 0);
  }

  @override
  Resource clone({int withWood, int withStone, int withGold}) => Resource(
      wood: withWood ?? wood,
      stone: withStone ?? stone,
      gold: withGold ?? gold);

  @override
  Resource operator +(value) {
    if (value is int) {
      return Resource(
          wood: wood + value, stone: stone + value, gold: gold + value);
    } else if (value is ConstResource) {
      return Resource(
          wood: wood + value.wood,
          stone: stone + value.stone,
          gold: gold + value.gold);
    } else {
      throw UnsupportedError('unsupported type');
    }
  }

  @override
  Resource operator *(int value) =>
      Resource(wood: wood * value, stone: stone * value, gold: gold * value);

  void addition(value) {
    // TODO
  }
  void subtract(value) {
    // TODO
  }

  @override
  bool operator <(other) {
    if (other is int) {
      return wood < other || stone < other || gold < other;
    } else if (other is ConstResource) {
      return wood < other.wood || stone < other.stone || gold < other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  @override
  bool operator >(other) {
    if (other is int) {
      return wood > other || stone > other || gold > other;
    } else if (other is ConstResource) {
      return wood > other.wood || stone > other.stone || gold > other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  String toPgsql() {
    return '(${wood}, ${stone}, ${gold})::Resource';
  }
}

abstract class Spec {}

abstract class MapUnitSpec implements Spec {
  Kind get kind;
}

class BuildingSpec implements MapUnitSpec {
  final int type;

  final String name;

  final String description;

  final AttackType attackType;

  final Level10List<int> armor;

  final Level10List<int> pierceArmor;

  final Level10List<int> hp;

  final Level10List<ConstResource> constructionCost;

  final kind = Kind.building;

  const BuildingSpec(
      {@required this.type,
      @required this.name,
      @required this.description,
      @required this.attackType,
      @required this.armor,
      @required this.pierceArmor,
      @required this.hp,
      @required this.constructionCost});

  static BuildingSpec byType(int type) {
    // TODO
  }

  static const lumberCamp = BuildingSpec();

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

class WarriorSpec implements MapUnitSpec {
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

  @override
  final kind = Kind.warrior;

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

class Level10List<T> {
  final T level1;
  final T level2;
  final T level3;
  final T level4;
  final T level5;
  final T level6;
  final T level7;
  final T level8;
  final T level9;
  final T level10;

  const Level10List(
      {this.level1,
      this.level2,
      this.level3,
      this.level4,
      this.level5,
      this.level6,
      this.level7,
      this.level8,
      this.level9,
      this.level10});

  const Level10List.same(T value)
      : level1 = value,
        level2 = value,
        level3 = value,
        level4 = value,
        level5 = value,
        level6 = value,
        level7 = value,
        level8 = value,
        level9 = value,
        level10 = value;

  T operator [](int index) {
    switch (index) {
      case 0:
        return level1;
      case 1:
        return level2;
      case 2:
        return level3;
      case 3:
        return level4;
      case 4:
        return level5;
      case 5:
        return level6;
      case 6:
        return level7;
      case 7:
        return level8;
      case 8:
        return level9;
      case 9:
        return level10;
      default:
        throw RangeError.index(index, this);
    }
  }
}

class ResearchSpec implements Spec {
  final int technologyId;

  final String name;

  final String description;

  final Level10List<Resource> cost;

  final Level10List<int> duration;

  ResearchSpec(
      {@required this.technologyId,
      @required this.name,
      @required this.description,
      @required this.cost,
      @required this.duration});

  static ResearchSpec byTechnologyId(int id) {
    switch (id) {
      // TODO
    }
  }
}
