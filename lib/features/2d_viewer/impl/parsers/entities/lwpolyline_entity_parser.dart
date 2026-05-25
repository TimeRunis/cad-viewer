import 'package:cad_viewer/features/2d_viewer/impl/parsers/entity_parser_base.dart';

import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/polyline_entity.dart';

class LWPolylineEntityParser extends EntityParserBase {
  static PolylineEntity? parse(
    Map<String, dynamic> json,
  ) {
    final points = json['points'];

    if (points == null || points is! List) {
      return null;
    }

    final vertices = <CadPoint>[];

    for (final p in points) {
      if (p is List && p.length >= 2) {
        vertices.add(
          CadPoint.fromList(p),
        );
      }
    }

    final bulges = <double>[];

    if (json['bulges'] is List) {
      for (final b in json['bulges']) {
        bulges.add(
          (b as num).toDouble(),
        );
      }
    }

    return PolylineEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      vertices: vertices,
      bulges: bulges,
      closed: ((json['flag'] ?? 0) as int) & 1 != 0,
    );
  }
}
