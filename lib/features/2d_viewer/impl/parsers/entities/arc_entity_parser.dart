import 'package:cad_viewer/features/2d_viewer/impl/parsers/entity_parser_base.dart';

import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/arc_entity.dart';

class ArcEntityParser extends EntityParserBase {
  static ArcEntity? parse(
    Map<String, dynamic> json,
  ) {
    final center = json['center'];

    final radius = json['radius'];

    final startAngle = json['start_angle'];

    final endAngle = json['end_angle'];

    if (center == null ||
        radius == null ||
        startAngle == null ||
        endAngle == null) {
      return null;
    }

    return ArcEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      center: CadPoint.fromList(center),
      radius: (radius as num).toDouble(),
      startAngle: (startAngle as num).toDouble(),
      endAngle: (endAngle as num).toDouble(),
    );
  }
}
