import 'package:meta/meta.dart';

import 'package:common/common.dart';

abstract class CityEntity {
  Position get position;

  String get kind;

  dynamic toJson();
}

class CityTerrain implements CityEntity {
  @override
  final Position position;

  final String type;

  @override
  final String kind = 'TERRAIN';

  CityTerrain({@required this.position, @required this.type});

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'position': position.toJson(),
        'kind': kind,
      };
}

class Building implements CityEntity {
  final int id;

  final int type;

  @override
  final Position position;

  final int level;

  @override
  final String kind = 'BUILDING';

  Building(
      {@required this.id,
      @required this.type,
      @required this.position,
      @required this.level});

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'position': position.toJson(),
        'level': level,
        'kind': kind,
      };
}

class City {
  final int id;

  final String name;

  final Map<Position, CityEntity> children;

  final LazyResource resources;

  City(
      {@required this.id,
      @required this.name,
      @required this.children,
      @required this.resources});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'children': children
            .map((key, value) => MapEntry(key.toJson(), value.toJson())),
        'resources': resources.toJson(),
      };
}
