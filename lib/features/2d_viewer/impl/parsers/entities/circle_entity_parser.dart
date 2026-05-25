import 'package:cad_viewer/features/2d_viewer/impl/parsers/entity_parser_base.dart';

import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/circle_entity.dart';

class CircleEntityParser extends EntityParserBase {
  static CircleEntity? parse(
    Map<String, dynamic> json,
  ) {
    final center = json['center'];

    final radius = json['radius'];

    if (center == null || radius == null) {
      return null;
    }

    return CircleEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      center: CadPoint.fromList(center),
      radius: (radius as num).toDouble(),
    );
  }
}
