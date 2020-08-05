import 'package:common/common.dart';
import 'package:meta/meta.dart';
import 'package:duration/duration.dart';

class Recruiting {
  final int id;

  final int type;

  final int count;

  final DateTime start;

  final DateTime finish;

  Recruiting(
      {@required this.id,
      @required this.type,
      @required this.count,
      @required this.start,
      @required this.finish});

  bool get hasFinished => finish.isBefore(DateTime.now().toUtc());

  Duration get timeLeft => finish.difference(DateTime.now());

  String get timeLeftStr => timeLeft.isNegative || timeLeft.inSeconds == 0
      ? ''
      : prettyDuration(
          timeLeft,
          first: true,
          abbreviated: true,
        );

  double get percentage {
    final now = DateTime.now();

    if (now.isAfter(finish)) {
      return 100;
    }

    final total = finish.difference(start).inSeconds;
    final trained = now.difference(start).inSeconds;

    return (trained * 100) / total;
  }

  WarriorSpec get spec => WarriorSpec.byType(type);

  String get css => spec.css;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'count': count,
        'start': start.toUtc().toIso8601String(),
        'finish': finish.toUtc().toIso8601String(),
      };

  static Recruiting fromMap(Map map) => Recruiting(
      id: map['id'],
      type: map['type'],
      count: map['count'],
      start: parseUTCTime(map['start']),
      finish: parseUTCTime(map['finish']));
}

class Fighter {
  int type;

  int count;

  final WarriorSpec spec;

  final String css;

  Fighter({@required this.type, @required this.count})
      : spec = WarriorSpec.byType(type),
        css = WarriorSpec.byType(type).css;

  Map<String, dynamic> toJson() => {
        'type': type,
        'count': count,
      };

  static Fighter fromMap(Map map) =>
      Fighter(type: map['type'], count: map['count']);
}
