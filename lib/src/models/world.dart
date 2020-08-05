import 'package:common/common.dart';

abstract class WorldMapEntity {
  Position get position;

  WorldMapTileKind get kind;

  Map<String, dynamic> toJson();

  static WorldMapEntity fromMap(Map map) {
    final kind = WorldMapTileKind.fromName(map['kind']);
    final position = Position.fromString(map['position']);

    switch (kind) {
      case WorldMapTileKind.forest:
        return WorldMapTerrain(
            position: position, kind: WorldMapTileKind.forest);
      case WorldMapTileKind.mountain:
        return WorldMapTerrain(
            position: position, kind: WorldMapTileKind.mountain);
      case WorldMapTileKind.hill:
        return WorldMapTerrain(position: position, kind: WorldMapTileKind.hill);
      case WorldMapTileKind.city:
        return WorldMapCity.fromMap(map, position: position);
      case WorldMapTileKind.dungeon:
        return WorldMapDungeon.fromMap(map, position: position);
      default:
        throw Exception('');
    }
  }
}

class WorldMapTerrain implements WorldMapEntity {
  @override
  final Position position;

  @override
  final WorldMapTileKind kind;

  WorldMapTerrain({this.position, this.kind});

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'position': position.toJson(),
        'kind': kind.name,
      };
}

class WorldMapCity implements WorldMapEntity {
  @override
  final Position position;

  @override
  final WorldMapTileKind kind = WorldMapTileKind.city;

  final int id;

  final int level;

  WorldMapCity({this.position, this.id, this.level});

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'position': position.toJson(),
        'kind': kind.name,
        'id': id,
        'level': level,
      };

  static WorldMapCity fromMap(Map map, {Position position}) {
    return WorldMapCity(position: position, id: map['id'], level: map['level']);
  }
}

class WorldMapDungeon implements WorldMapEntity {
  @override
  final Position position;

  @override
  final WorldMapTileKind kind = WorldMapTileKind.dungeon;

  final int id;

  final int level;

  WorldMapDungeon({this.position, this.id, this.level});

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'position': position.toJson(),
        'kind': kind.name,
        'id': id,
        'level': level,
      };

  static WorldMapDungeon fromMap(Map map, {Position position}) {
    return WorldMapDungeon(
        position: position, id: map['id'], level: map['level']);
  }
}

class World {
  final List<WorldMapEntity> tiles;

  World({this.tiles});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tiles': tiles.map((t) => t.toJson()).toList(),
      };

  static World fromMap(Map map) => World(
      tiles: (map['tiles'] as List).cast<Map>().map(WorldMapEntity.fromMap));
}
