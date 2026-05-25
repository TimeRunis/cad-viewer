import '../../../../../shared/models/base/cad_point.dart';

import '../../../../../shared/models/entities/text_entity.dart';

import '../entity_parser_base.dart';

class TextEntityParser {
  static TextEntity? parse(
    Map<String, dynamic> json,
  ) {
    final insPt = json['ins_pt'];

    final text = json['text_value'];

    if (insPt == null || text == null) {
      return null;
    }

    return TextEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: EntityParserBase.parseLayer(json),
      color: EntityParserBase.parseColor(json),
      insertionPoint: CadPoint.fromList(
        insPt,
      ),
      text: text.toString(),
      height: (json['height'] as num?)?.toDouble() ?? 20.0,
      rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
