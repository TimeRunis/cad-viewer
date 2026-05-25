import '../../../../shared/models/base/cad_entity.dart';

import 'entities/arc_entity_parser.dart';
import 'entities/circle_entity_parser.dart';
import 'entities/insert_entity_parser.dart';
import 'entities/line_entity_parser.dart';
import 'entities/lwpolyline_entity_parser.dart';
import 'entities/mtext_entity_parser.dart';
import 'entities/spline_entity_parser.dart';
import 'entities/text_entity_parser.dart';

typedef ParserFunc = CadEntity? Function(
  Map<String, dynamic>,
);

class ParserRegistryBuilder {
  static Map<String, ParserFunc> build() {
    return {
      // 基础图元
      'LINE': LineEntityParser.parse,

      'CIRCLE': CircleEntityParser.parse,

      'ARC': ArcEntityParser.parse,

      // 多段线
      'LWPOLYLINE': LWPolylineEntityParser.parse,

      'POLYLINE': LWPolylineEntityParser.parse,

      // 文字
      'TEXT': TextEntityParser.parse,

      'MTEXT': MTextEntityParser.parse,

      // 样条
      'SPLINE': SplineEntityParser.parse,

      // 块引用
      'INSERT': InsertEntityParser.parse,
    };
  }
}
