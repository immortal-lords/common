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

  final int minCCLevel;

  final Level20List<ConstResource> constructionCost;

  final Level20List<Duration> constructionDuration;

  final Level20List<int> production1;

  final Level20List<int> production2;

  const BuildingSpec({
    @required this.type,
    @required this.name,
    @required this.description,
    @required this.minCCLevel,
    @required this.constructionCost,
    @required this.constructionDuration,
    @required this.production1,
    @required this.production2,
  });

  static const cityCenterId = 0;

  static const lumberCampId = 1;

  static const quarryId = 2;

  static const goldMineId = 3;

  static const warehouseId = 4;

  static const barrackId = 5;

  static BuildingSpec byType(int type) {
    switch (type) {
      case cityCenterId:
        return cityCenter;
      case lumberCampId:
        return lumberCamp;
      case quarryId:
        return quarry;
      case goldMineId:
        return goldMine;
      case warehouseId:
        return warehouse;
      case barrackId:
        return barrack;
      // TODO
      default:
        throw Exception('unknown building type $type');
    }
    // TODO
  }

  static const buildings = [
    lumberCamp,
    quarry,
    goldMine,
    warehouse,
    barrack,
  ];

  static const cityCenter = BuildingSpec(
    type: cityCenterId,
    name: 'City center',
    description: '',
    minCCLevel: 0,
    constructionCost: Level20List(
        level1: ConstResource(wood: 100, stone: 0, gold: 0),
        level2: ConstResource(wood: 500, stone: 0, gold: 0),
        level3: ConstResource(wood: 750, stone: 0, gold: 0),
        level4: ConstResource(wood: 1000, stone: 0, gold: 0),
        level5: ConstResource(wood: 2500, stone: 500, gold: 0),
        level6: ConstResource(wood: 5000, stone: 1000, gold: 0),
        level7: ConstResource(wood: 10000, stone: 2000, gold: 0),
        level8: ConstResource(wood: 15000, stone: 3000, gold: 0),
        level9: ConstResource(wood: 20000, stone: 4000, gold: 0),
        level10: ConstResource(wood: 25000, stone: 5000, gold: 0),
        level11: ConstResource(wood: 50000, stone: 10000, gold: 500),
        level12: ConstResource(wood: 75000, stone: 15000, gold: 1500),
        level13: ConstResource(wood: 100000, stone: 20000, gold: 2500),
        level14: ConstResource(wood: 125000, stone: 25000, gold: 3500),
        level15: ConstResource(wood: 150000, stone: 50000, gold: 4500),
        level16: ConstResource(wood: 175000, stone: 75000, gold: 7000),
        level17: ConstResource(wood: 200000, stone: 100000, gold: 9500),
        level18: ConstResource(wood: 225000, stone: 125000, gold: 14500),
        level19: ConstResource(wood: 250000, stone: 150000, gold: 19500),
        level20: ConstResource(wood: 300000, stone: 175000, gold: 24500)),
    constructionDuration: Level20List(
      level1: Duration(seconds: 0),
      level2: Duration(seconds: 150),
      level3: Duration(seconds: 300),
      level4: Duration(seconds: 1800),
      level5: Duration(seconds: 3600),
      level6: Duration(seconds: 14400),
      level7: Duration(seconds: 25200),
      level8: Duration(seconds: 36000),
      level9: Duration(seconds: 46800),
      level10: Duration(seconds: 86400),
      level11: Duration(seconds: 103680),
      level12: Duration(seconds: 120960),
      level13: Duration(seconds: 138240),
      level14: Duration(seconds: 155520),
      level15: Duration(seconds: 172800),
      level16: Duration(seconds: 207360),
      level17: Duration(seconds: 241920),
      level18: Duration(seconds: 276480),
      level19: Duration(seconds: 311040),
      level20: Duration(seconds: 345600),
    ),
    production1: Level20List(
        level1: 0,
        level2: 5,
        level3: 10,
        level4: 25,
        level5: 50,
        level6: 60,
        level7: 70,
        level8: 80,
        level9: 90,
        level10: 100,
        level11: 125,
        level12: 150,
        level13: 175,
        level14: 200,
        level15: 250,
        level16: 300,
        level17: 350,
        level18: 400,
        level19: 450,
        level20: 500),
    production2: Level20List(
        level1: 0,
        level2: 0,
        level3: 0,
        level4: 0,
        level5: 0,
        level6: 0,
        level7: 0,
        level8: 0,
        level9: 0,
        level10: 0,
        level11: 1,
        level12: 2,
        level13: 3,
        level14: 4,
        level15: 5,
        level16: 6,
        level17: 7,
        level18: 8,
        level19: 9,
        level20: 10),
  );

  static const lumberCamp = BuildingSpec(
    type: lumberCampId,
    name: 'Lumber camp',
    description:
        '''Wood is a great building material and can be harvested in abundance wherever there are trees. Lumber camps are hives of activity, turning nearby trees into logs for construction of buildings.
Place lumber camps near as many trees as you can in order to maximize wood production. Lumber camp wood production will be further increased by touching warehouses.''',
    minCCLevel: 1,
    constructionCost: Level20List(
        level1: ConstResource(wood: 50, stone: 0, gold: 0),
        level2: ConstResource(wood: 100, stone: 0, gold: 0),
        level3: ConstResource(wood: 150, stone: 50, gold: 0),
        level4: ConstResource(wood: 200, stone: 100, gold: 0),
        level5: ConstResource(wood: 250, stone: 150, gold: 0),
        level6: ConstResource(wood: 500, stone: 250, gold: 0),
        level7: ConstResource(wood: 1000, stone: 500, gold: 0),
        level8: ConstResource(wood: 1500, stone: 750, gold: 0),
        level9: ConstResource(wood: 2000, stone: 1000, gold: 0),
        level10: ConstResource(wood: 2500, stone: 1250, gold: 0),
        level11: ConstResource(wood: 5000, stone: 1500, gold: 0),
        level12: ConstResource(wood: 10000, stone: 1750, gold: 0),
        level13: ConstResource(wood: 15000, stone: 2000, gold: 0),
        level14: ConstResource(wood: 20000, stone: 2250, gold: 0),
        level15: ConstResource(wood: 25000, stone: 2500, gold: 0),
        level16: ConstResource(wood: 30000, stone: 5000, gold: 0),
        level17: ConstResource(wood: 35000, stone: 10000, gold: 0),
        level18: ConstResource(wood: 40000, stone: 15000, gold: 0),
        level19: ConstResource(wood: 45000, stone: 20000, gold: 0),
        level20: ConstResource(wood: 50000, stone: 25000, gold: 0)),
    constructionDuration: Level20List(
        level1: Duration(seconds: 30),
        level2: Duration(seconds: 150),
        level3: Duration(seconds: 300),
        level4: Duration(seconds: 900),
        level5: Duration(seconds: 1800),
        level6: Duration(seconds: 3600),
        level7: Duration(seconds: 7200),
        level8: Duration(seconds: 14400),
        level9: Duration(seconds: 28800),
        level10: Duration(seconds: 43200),
        level11: Duration(seconds: 51840),
        level12: Duration(seconds: 60480),
        level13: Duration(seconds: 69120),
        level14: Duration(seconds: 77760),
        level15: Duration(seconds: 86400),
        level16: Duration(seconds: 103680),
        level17: Duration(seconds: 120960),
        level18: Duration(seconds: 138240),
        level19: Duration(seconds: 155520),
        level20: Duration(seconds: 172800)),
    production1: Level20List(
        level1: 20,
        level2: 22,
        level3: 24,
        level4: 26,
        level5: 28,
        level6: 30,
        level7: 35,
        level8: 40,
        level9: 45,
        level10: 50,
        level11: 55,
        level12: 60,
        level13: 65,
        level14: 70,
        level15: 75,
        level16: 80,
        level17: 85,
        level18: 90,
        level19: 95,
        level20: 100),
    production2: Level20List(
        level1: 5,
        level2: 5,
        level3: 5,
        level4: 5,
        level5: 5,
        level6: 10,
        level7: 10,
        level8: 10,
        level9: 10,
        level10: 10,
        level11: 20,
        level12: 20,
        level13: 20,
        level14: 20,
        level15: 20,
        level16: 25,
        level17: 25,
        level18: 25,
        level19: 25,
        level20: 25),
  );

  static const quarry = BuildingSpec(
    type: quarryId,
    name: 'Quarry',
    description: '',
    minCCLevel: 3,
    constructionCost: Level20List(
        level1: ConstResource(wood: 50, stone: 0, gold: 0),
        level2: ConstResource(wood: 100, stone: 0, gold: 0),
        level3: ConstResource(wood: 150, stone: 50, gold: 0),
        level4: ConstResource(wood: 200, stone: 100, gold: 0),
        level5: ConstResource(wood: 250, stone: 150, gold: 0),
        level6: ConstResource(wood: 500, stone: 250, gold: 0),
        level7: ConstResource(wood: 1000, stone: 500, gold: 0),
        level8: ConstResource(wood: 1500, stone: 750, gold: 0),
        level9: ConstResource(wood: 2000, stone: 1000, gold: 0),
        level10: ConstResource(wood: 2500, stone: 1250, gold: 0),
        level11: ConstResource(wood: 5000, stone: 1500, gold: 0),
        level12: ConstResource(wood: 10000, stone: 1750, gold: 0),
        level13: ConstResource(wood: 15000, stone: 2000, gold: 0),
        level14: ConstResource(wood: 20000, stone: 2250, gold: 0),
        level15: ConstResource(wood: 25000, stone: 2500, gold: 0),
        level16: ConstResource(wood: 30000, stone: 5000, gold: 0),
        level17: ConstResource(wood: 35000, stone: 10000, gold: 0),
        level18: ConstResource(wood: 40000, stone: 15000, gold: 0),
        level19: ConstResource(wood: 45000, stone: 20000, gold: 0),
        level20: ConstResource(wood: 50000, stone: 25000, gold: 0)),
    constructionDuration: Level20List(
        level1: Duration(seconds: 30),
        level2: Duration(seconds: 150),
        level3: Duration(seconds: 300),
        level4: Duration(seconds: 900),
        level5: Duration(seconds: 1800),
        level6: Duration(seconds: 3600),
        level7: Duration(seconds: 7200),
        level8: Duration(seconds: 14400),
        level9: Duration(seconds: 28800),
        level10: Duration(seconds: 43200),
        level11: Duration(seconds: 51840),
        level12: Duration(seconds: 60480),
        level13: Duration(seconds: 69120),
        level14: Duration(seconds: 77760),
        level15: Duration(seconds: 86400),
        level16: Duration(seconds: 103680),
        level17: Duration(seconds: 120960),
        level18: Duration(seconds: 138240),
        level19: Duration(seconds: 155520),
        level20: Duration(seconds: 172800)),
    production1: Level20List(
        level1: 20,
        level2: 22,
        level3: 24,
        level4: 26,
        level5: 28,
        level6: 30,
        level7: 35,
        level8: 40,
        level9: 45,
        level10: 50,
        level11: 55,
        level12: 60,
        level13: 65,
        level14: 70,
        level15: 75,
        level16: 80,
        level17: 85,
        level18: 90,
        level19: 95,
        level20: 100),
    production2: Level20List(
        level1: 5,
        level2: 5,
        level3: 5,
        level4: 5,
        level5: 5,
        level6: 10,
        level7: 10,
        level8: 10,
        level9: 10,
        level10: 10,
        level11: 20,
        level12: 20,
        level13: 20,
        level14: 20,
        level15: 20,
        level16: 25,
        level17: 25,
        level18: 25,
        level19: 25,
        level20: 25),
  );

  static const goldMine = BuildingSpec(
    type: goldMineId,
    name: 'Gold mine',
    description: '',
    minCCLevel: 10,
    constructionCost: Level20List(
        level1: ConstResource(wood: 100, stone: 50, gold: 0),
        level2: ConstResource(wood: 200, stone: 100, gold: 0),
        level3: ConstResource(wood: 300, stone: 150, gold: 0),
        level4: ConstResource(wood: 400, stone: 200, gold: 0),
        level5: ConstResource(wood: 500, stone: 250, gold: 0),
        level6: ConstResource(wood: 1000, stone: 500, gold: 0),
        level7: ConstResource(wood: 2000, stone: 750, gold: 0),
        level8: ConstResource(wood: 3000, stone: 1000, gold: 0),
        level9: ConstResource(wood: 4000, stone: 1250, gold: 0),
        level10: ConstResource(wood: 5000, stone: 1500, gold: 0),
        level11: ConstResource(wood: 10000, stone: 1750, gold: 0),
        level12: ConstResource(wood: 20000, stone: 2000, gold: 0),
        level13: ConstResource(wood: 30000, stone: 3000, gold: 0),
        level14: ConstResource(wood: 40000, stone: 4000, gold: 0),
        level15: ConstResource(wood: 50000, stone: 5000, gold: 0),
        level16: ConstResource(wood: 60000, stone: 10000, gold: 0),
        level17: ConstResource(wood: 70000, stone: 20000, gold: 0),
        level18: ConstResource(wood: 80000, stone: 30000, gold: 0),
        level19: ConstResource(wood: 90000, stone: 40000, gold: 0),
        level20: ConstResource(wood: 100000, stone: 50000, gold: 0)),
    constructionDuration: Level20List(
      level1: Duration(seconds: 30),
      level2: Duration(seconds: 150),
      level3: Duration(seconds: 300),
      level4: Duration(seconds: 900),
      level5: Duration(seconds: 1800),
      level6: Duration(seconds: 3600),
      level7: Duration(seconds: 7200),
      level8: Duration(seconds: 14400),
      level9: Duration(seconds: 28800),
      level10: Duration(seconds: 43200),
      level11: Duration(seconds: 51840),
      level12: Duration(seconds: 60480),
      level13: Duration(seconds: 69120),
      level14: Duration(seconds: 77760),
      level15: Duration(seconds: 86400),
      level16: Duration(seconds: 103680),
      level17: Duration(seconds: 120960),
      level18: Duration(seconds: 138240),
      level19: Duration(seconds: 155520),
      level20: Duration(seconds: 172800),
    ),
    production1: Level20List(
        level1: 20,
        level2: 22,
        level3: 24,
        level4: 26,
        level5: 28,
        level6: 30,
        level7: 32,
        level8: 34,
        level9: 36,
        level10: 38,
        level11: 40,
        level12: 42,
        level13: 44,
        level14: 46,
        level15: 48,
        level16: 50,
        level17: 55,
        level18: 60,
        level19: 65,
        level20: 70),
    production2: Level20List(
        level1: 5,
        level2: 5,
        level3: 5,
        level4: 5,
        level5: 5,
        level6: 10,
        level7: 10,
        level8: 10,
        level9: 10,
        level10: 10,
        level11: 15,
        level12: 15,
        level13: 15,
        level14: 15,
        level15: 15,
        level16: 20,
        level17: 20,
        level18: 20,
        level19: 20,
        level20: 20),
  );

  static const warehouse = BuildingSpec(
    type: warehouseId,
    name: 'Warehouse',
    description: '',
    minCCLevel: 2,
    constructionCost: Level20List(
        level1: ConstResource(wood: 100, stone: 50, gold: 0),
        level2: ConstResource(wood: 200, stone: 100, gold: 0),
        level3: ConstResource(wood: 300, stone: 150, gold: 0),
        level4: ConstResource(wood: 400, stone: 200, gold: 0),
        level5: ConstResource(wood: 500, stone: 250, gold: 0),
        level6: ConstResource(wood: 1000, stone: 500, gold: 0),
        level7: ConstResource(wood: 2000, stone: 750, gold: 0),
        level8: ConstResource(wood: 3000, stone: 1000, gold: 0),
        level9: ConstResource(wood: 4000, stone: 1250, gold: 0),
        level10: ConstResource(wood: 5000, stone: 1500, gold: 0),
        level11: ConstResource(wood: 10000, stone: 1750, gold: 0),
        level12: ConstResource(wood: 20000, stone: 2000, gold: 0),
        level13: ConstResource(wood: 30000, stone: 3000, gold: 0),
        level14: ConstResource(wood: 40000, stone: 4000, gold: 0),
        level15: ConstResource(wood: 50000, stone: 5000, gold: 0),
        level16: ConstResource(wood: 60000, stone: 10000, gold: 0),
        level17: ConstResource(wood: 70000, stone: 20000, gold: 0),
        level18: ConstResource(wood: 80000, stone: 30000, gold: 0),
        level19: ConstResource(wood: 90000, stone: 40000, gold: 0),
        level20: ConstResource(wood: 100000, stone: 50000, gold: 0)),
    constructionDuration: Level20List(
        level1: Duration(seconds: 30),
        level2: Duration(seconds: 150),
        level3: Duration(seconds: 300),
        level4: Duration(seconds: 900),
        level5: Duration(seconds: 1800),
        level6: Duration(seconds: 3600),
        level7: Duration(seconds: 7200),
        level8: Duration(seconds: 14400),
        level9: Duration(seconds: 28800),
        level10: Duration(seconds: 43200),
        level11: Duration(seconds: 51840),
        level12: Duration(seconds: 60480),
        level13: Duration(seconds: 69120),
        level14: Duration(seconds: 77760),
        level15: Duration(seconds: 86400),
        level16: Duration(seconds: 103680),
        level17: Duration(seconds: 120960),
        level18: Duration(seconds: 138240),
        level19: Duration(seconds: 155520),
        level20: Duration(seconds: 172800)),
    production1: Level20List(
        level1: 100,
        level2: 200,
        level3: 300,
        level4: 400,
        level5: 500,
        level6: 1000,
        level7: 2000,
        level8: 3000,
        level9: 4000,
        level10: 5000,
        level11: 6000,
        level12: 7000,
        level13: 8000,
        level14: 9000,
        level15: 10000,
        level16: 15000,
        level17: 20000,
        level18: 30000,
        level19: 40000,
        level20: 50000),
    production2: Level20List(
        level1: 1,
        level2: 2,
        level3: 3,
        level4: 4,
        level5: 5,
        level6: 6,
        level7: 7,
        level8: 8,
        level9: 9,
        level10: 10,
        level11: 11,
        level12: 12,
        level13: 13,
        level14: 14,
        level15: 15,
        level16: 16,
        level17: 17,
        level18: 18,
        level19: 19,
        level20: 20),
  );

  static const barrack = BuildingSpec(
      type: 4,
      name: 'Barrack',
      description: '',
      minCCLevel: 2,
      constructionCost: Level20List(
          level1: ConstResource(wood: 100, stone: 0, gold: 0),
          level2: ConstResource(wood: 200, stone: 100, gold: 0),
          level3: ConstResource(wood: 300, stone: 150, gold: 0),
          level4: ConstResource(wood: 400, stone: 200, gold: 0),
          level5: ConstResource(wood: 500, stone: 250, gold: 0),
          level6: ConstResource(wood: 1000, stone: 500, gold: 100),
          level7: ConstResource(wood: 2000, stone: 750, gold: 200),
          level8: ConstResource(wood: 3000, stone: 1000, gold: 300),
          level9: ConstResource(wood: 4000, stone: 1250, gold: 400),
          level10: ConstResource(wood: 5000, stone: 1500, gold: 500),
          level11: ConstResource(wood: 10000, stone: 1750, gold: 1000),
          level12: ConstResource(wood: 20000, stone: 2000, gold: 2000),
          level13: ConstResource(wood: 30000, stone: 3000, gold: 3000),
          level14: ConstResource(wood: 40000, stone: 4000, gold: 4000),
          level15: ConstResource(wood: 50000, stone: 5000, gold: 5000),
          level16: ConstResource(wood: 60000, stone: 10000, gold: 7500),
          level17: ConstResource(wood: 70000, stone: 20000, gold: 10000),
          level18: ConstResource(wood: 80000, stone: 30000, gold: 15000),
          level19: ConstResource(wood: 90000, stone: 40000, gold: 20000),
          level20: ConstResource(wood: 100000, stone: 50000, gold: 25000)),
      constructionDuration: Level20List(
          level1: Duration(seconds: 30),
          level2: Duration(seconds: 150),
          level3: Duration(seconds: 300),
          level4: Duration(seconds: 900),
          level5: Duration(seconds: 1800),
          level6: Duration(seconds: 3600),
          level7: Duration(seconds: 7200),
          level8: Duration(seconds: 14400),
          level9: Duration(seconds: 28800),
          level10: Duration(seconds: 43200),
          level11: Duration(seconds: 51840),
          level12: Duration(seconds: 60480),
          level13: Duration(seconds: 69120),
          level14: Duration(seconds: 77760),
          level15: Duration(seconds: 86400),
          level16: Duration(seconds: 103680),
          level17: Duration(seconds: 120960),
          level18: Duration(seconds: 138240),
          level19: Duration(seconds: 155520),
          level20: Duration(seconds: 172800)),
      production1: Level20List(
          level1: 5,
          level2: 10,
          level3: 15,
          level4: 20,
          level5: 25,
          level6: 30,
          level7: 35,
          level8: 40,
          level9: 45,
          level10: 50,
          level11: 55,
          level12: 60,
          level13: 65,
          level14: 70,
          level15: 75,
          level16: 80,
          level17: 85,
          level18: 90,
          level19: 95,
          level20: 100),
      production2: Level20List(
          level1: 3,
          level2: 3,
          level3: 3,
          level4: 4,
          level5: 4,
          level6: 5,
          level7: 5,
          level8: 5,
          level9: 5,
          level10: 5,
          level11: 7,
          level12: 7,
          level13: 7,
          level14: 7,
          level15: 7,
          level16: 8,
          level17: 8,
          level18: 9,
          level19: 9,
          level20: 10));

  static const sanctum = BuildingSpec(
      type: 5, name: 'Sanctum', description: null, constructionCost: null);
}
