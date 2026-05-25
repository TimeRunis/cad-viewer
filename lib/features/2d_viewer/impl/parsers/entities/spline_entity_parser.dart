import 'package:cad_viewer/features/2d_viewer/impl/parsers/entity_parser_base.dart';

import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/spline_entity.dart';

class SplineEntityParser extends EntityParserBase {
  static SplineEntity? parse(
    Map<String, dynamic> json,
  ) {
    final ctrlPts = json['ctrl_pts'];

    if (ctrlPts == null || ctrlPts is! List) {
      return null;
    }

    final points = <CadPoint>[];

    for (final p in ctrlPts) {
      if (p is Map) {
        points.add(
          CadPoint(
            ((p['x'] ?? 0) as num).toDouble(),
            ((p['y'] ?? 0) as num).toDouble(),
            ((p['z'] ?? 0) as num).toDouble(),
          ),
        );
      }
    }

    final knots = <double>[];

    if (json['knots'] is List) {
      for (final k in json['knots']) {
        knots.add(
          (k as num).toDouble(),
        );
      }
    }

    return SplineEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      degree: (json['degree'] ?? 3) as int,
      closed: (json['closed_b'] ?? 0) == 1,
      knots: knots,
      controlPoints: points,
    );
  }
}
