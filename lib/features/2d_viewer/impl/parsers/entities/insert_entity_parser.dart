import 'package:cad_viewer/core/handle_utils.dart';
import 'package:cad_viewer/features/2d_viewer/impl/parsers/entity_parser_base.dart';
import 'package:cad_viewer/shared/models/base/cad_point.dart';
import 'package:cad_viewer/shared/models/entities/insert_entity.dart';

class InsertEntityParser {
  static InsertEntity? parse(
    Map<String, dynamic> json,
  ) {
    final ins = json['ins_pt'];

    if (ins == null) {
      return null;
    }

    final block = json['block_header'];

    final blockHandle = HandleUtils.normalize(
      json['block_header'],
    );

    final scale = json['scale'];

    return InsertEntity(
      handle: EntityParserBase.parseHandle(json),
      layer: '0',
      color: (EntityParserBase.parseColor(json) ?? 7),
      blockHandle: blockHandle,
      insertionPoint: CadPoint.fromList(ins),
      rotation: (json['rotation'] ?? 0).toDouble(),
      scale: scale is List
          ? CadPoint.fromList(scale)
          : const CadPoint(
              1,
              1,
              1,
            ),
    );
  }
}
