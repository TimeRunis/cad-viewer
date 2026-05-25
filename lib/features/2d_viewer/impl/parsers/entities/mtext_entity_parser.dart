import 'package:cad_viewer/core/mtext_formatter.dart';

import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/mtext_entity.dart';

import '../entity_parser_base.dart';

class MTextEntityParser {
  static MTextEntity? parse(
    Map<String, dynamic> json,
  ) {
    final insPt = json['ins_pt'];

    final text = json['text'];

    if (insPt == null || text == null) {
      return null;
    }

    return MTextEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      insertionPoint: CadPoint.fromList(
        insPt,
      ),
      text: MTextFormatter.clean(
        text.toString(),
      ),
      textHeight: (json['text_height'] as num?)?.toDouble() ?? 20.0,
      rotation: 0.0,
    );
  }
}
