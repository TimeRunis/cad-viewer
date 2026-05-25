import 'package:cad_viewer/features/2d_viewer/impl/parsers/entity_parser_base.dart';

import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/line_entity.dart';

class LineEntityParser extends EntityParserBase {
  static LineEntity? parse(
    Map<String, dynamic> json,
  ) {
    final start = json['start'];

    final end = json['end'];

    if (start == null || end == null) {
      return null;
    }

    return LineEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      start: CadPoint.fromList(start),
      end: CadPoint.fromList(end),
    );
  }
}
