import 'package:common/common.dart';
import 'package:meta/meta.dart';

class ResearchSpec {
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
