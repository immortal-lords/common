import 'package:meta/meta.dart';

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

  Resource operator *(num value) => Resource(
      wood: (wood * value).toInt(),
      stone: (stone * value).toInt(),
      gold: (gold * value).toInt());

  bool operator <(other) {
    if (other is int) {
      return wood < other && stone < other && gold < other;
    } else if (other is ConstResource) {
      return wood < other.wood && stone < other.stone && gold < other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  bool operator <=(other) {
    if (other is int) {
      return wood <= other && stone <= other && gold <= other;
    } else if (other is ConstResource) {
      return wood <= other.wood && stone <= other.stone && gold <= other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  bool operator >(other) {
    if (other is int) {
      return wood > other && stone > other && gold > other;
    } else if (other is ConstResource) {
      return wood > other.wood && stone > other.stone && gold > other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  bool operator >=(other) {
    if (other is int) {
      return wood >= other && stone >= other && gold >= other;
    } else if (other is ConstResource) {
      return wood >= other.wood && stone >= other.stone && gold >= other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  Map<String, dynamic> toJson() => {
        'wood': wood,
        'stone': stone,
        'gold': gold,
      };
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

  void limit(Resource other) {
    if (wood > other.wood) wood = other.wood;
    if (stone > other.stone) stone = other.stone;
    if (gold > other.gold) gold = other.gold;
  }

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
  Resource operator *(num value) => Resource(
      wood: (wood * value).toInt(),
      stone: (stone * value).toInt(),
      gold: (gold * value).toInt());

  void addition(value) {
    if (value is int) {
      wood = wood + value;
      stone = stone + value;
      gold = gold + value;
    } else if (value is ConstResource) {
      wood = wood + value.wood;
      stone = stone + value.stone;
      gold = gold + value.gold;
    } else {
      throw UnsupportedError('unsupported type');
    }
  }

  void subtract(value) {
    if (value is int) {
      wood = wood - value;
      stone = stone - value;
      gold = gold - value;
    } else if (value is ConstResource) {
      wood = wood - value.wood;
      stone = stone - value.stone;
      gold = gold - value.gold;
    } else {
      throw UnsupportedError('unsupported type');
    }
  }

  @override
  bool operator <(other) {
    if (other is int) {
      return wood < other && stone < other && gold < other;
    } else if (other is ConstResource) {
      return wood < other.wood && stone < other.stone && gold < other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  @override
  bool operator <=(other) {
    if (other is int) {
      return wood <= other && stone <= other && gold <= other;
    } else if (other is ConstResource) {
      return wood <= other.wood && stone <= other.stone && gold <= other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  @override
  bool operator >(other) {
    if (other is int) {
      return wood > other && stone > other && gold > other;
    } else if (other is ConstResource) {
      return wood > other.wood && stone > other.stone && gold > other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  @override
  bool operator >=(other) {
    if (other is int) {
      return wood >= other && stone >= other && gold >= other;
    } else if (other is ConstResource) {
      return wood >= other.wood && stone >= other.stone && gold >= other.gold;
    } else if (other == null) {
      throw ArgumentError.notNull();
    }
    throw UnsupportedError('not supported type ${other.runtimeType}');
  }

  @override
  Map<String, dynamic> toJson() => {
        'wood': wood,
        'stone': stone,
        'gold': gold,
      };
}

class LazyResource {
  final Resource resource;

  final Resource rate;

  final Resource max;

  final DateTime at;

  LazyResource(
      {@required this.resource,
      @required this.rate,
      @required this.max,
      @required DateTime at})
      : at = at;

  factory LazyResource.fromMap(Map map) {
    if (map == null) return null;

    DateTime at = parseUTCTime(map['at']);

    return LazyResource(
        resource: Resource.fromMap(map['resource']),
        rate: Resource.fromMap(map['rate']),
        max: Resource.fromMap(map['max']),
        at: at);
  }

  LazyResource cloneAt(DateTime newTime, {Resource newRate, Resource newMax}) {
    if (newTime.isBefore(at)) {
      throw Exception('new time should be in future');
    }

    // newTime = _truncate(newTime);

    final diff = newTime.difference(at);
    final diffInSeconds = diff.inSeconds;
    final duration = diffInSeconds / Duration.secondsPerHour;

    return LazyResource(
        resource: (resource + rate * duration)..limit(max),
        max: newMax ?? max,
        rate: newRate ?? rate,
        at: newTime);
  }

  Resource resourcesAt(DateTime when) {
    // when = _truncate(when);
    final duration = when.difference(at).inSeconds / Duration.secondsPerHour;
    return (resource + rate * duration)..limit(max);
  }

  bool hasEnough(ConstResource other) => resource >= other;

  void subtract(ConstResource other) {
    resource.subtract(other);
  }

  Map<String, dynamic> toJson() => {
        'resource': resource.toJson(),
        'rate': rate.toJson(),
        'max': max.toJson(),
        'at': at.toIso8601String(),
      };
}

DateTime parseUTCTime(String input) {
  DateTime at = DateTime.parse(input);
  if (!at.isUtc) {
    at = DateTime.parse(input + 'Z');
  }

  return at;
}