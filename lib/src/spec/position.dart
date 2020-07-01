class Position {
  int x;

  int y;

  Position({this.x = 0, this.y = 0});

  factory Position.fromString(String value) {
    if (!isValidPositionString(value)) {
      throw ArgumentError('invalid position string');
    }
    final parts = value.split('x').map((e) => int.parse(e));
    return Position(x: parts.elementAt(0), y: parts.elementAt(1));
  }

  factory Position.fromMap(Map map) =>
      Position(x: map['x'] ?? map['f0'], y: map['y'] ?? map['f1']);

  List<Position> getNeighbours() {
    final ret = <Position>[];

    for (int dx = -1; dx < 2; dx++) {
      for (int dy = -1; dy < 2; dy++) {
        final newX = x + dx;
        if (newX < 0) continue;

        final newY = y + dy;
        if (newY < 0) continue;

        if (newX == x && newY == y) continue;

        ret.add(Position(x: newX, y: newY));
      }
    }

    return ret;
  }

  String toJson() => toString();

  @override
  String toString() => '${x}x${y}';

  @override
  int get hashCode => x * 100000 + y;

  static RegExp positionStringRegExp = RegExp(r'^\d{1,5}x\d{1,5}$');
  static bool isValidPositionString(String value) {
    return positionStringRegExp.hasMatch(value);
  }
}
