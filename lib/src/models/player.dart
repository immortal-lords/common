import 'package:meta/meta.dart';

import 'package:common/common.dart';

class EmpireCity {
  final int id;

  final String name;

  final Position position;

  final int level;

  EmpireCity({
    @required this.id,
    @required this.name,
    @required this.position,
    @required this.level,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'position': position.toJson(),
        'level': level,
      };

  static EmpireCity fromMap(Map map) => EmpireCity(
        id: map['id'],
        name: map['name'],
        position: Position.fromString(map['position']),
        level: map['level'],
      );
}

class Empire {
  final int id;

  final String name;

  final List<EmpireCity> cities;

  Empire({@required this.id, @required this.name, @required this.cities});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cities': cities.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() => toJson().toString();

  static Empire fromMap(Map map) => Empire(
      id: map['id'],
      name: map['name'],
      cities: (map['cities'] as List)
          .cast<Map>()
          .map((e) => EmpireCity.fromMap(e))
          .toList());
}
