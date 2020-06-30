

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
  Resource operator *(int value) =>
      Resource(wood: wood * value, stone: stone * value, gold: gold * value);

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
}