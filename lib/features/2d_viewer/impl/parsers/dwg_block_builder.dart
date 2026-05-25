import 'package:cad_viewer/core/handle_utils.dart';

import '../../../../shared/models/base/cad_entity.dart';
import '../../../../shared/models/base/cad_point.dart';

import '../../../../shared/models/blocks/cad_block.dart';

import 'dwg_entity_parser.dart';

class DwgBlockBuilder {
  final DwgEntityParser _entityParser = DwgEntityParser();

  Map<String, CadBlock> buildBlocks(
    List<dynamic> objects,
  ) {
    final blocks = <String, CadBlock>{};

    int i = 0;

    while (i < objects.length) {
      final obj = objects[i];

      if (obj is! Map<String, dynamic>) {
        i++;
        continue;
      }

      if (obj['entity'] != 'BLOCK') {
        i++;
        continue;
      }

      final name = obj['name']?.toString() ?? '';

      final handle = HandleUtils.normalize(
        obj['handle'],
      );

      final basePt = obj['base_pt'];

      final entities = <CadEntity>[];

      i++;

      while (i < objects.length) {
        final child = objects[i];

        if (child is! Map<String, dynamic>) {
          i++;
          continue;
        }

        if (child['entity'] == 'ENDBLK') {
          break;
        }

        final entity = _entityParser.parse(child);

        if (entity != null) {
          entities.add(entity);
        }

        i++;
      }

      blocks[handle] = CadBlock(
        handle: handle,
        name: name,
        basePoint: basePt is List
            ? CadPoint.fromList(
                basePt,
              )
            : const CadPoint(
                0,
                0,
                0,
              ),
        entities: entities,
      );

      i++;
    }

    return blocks;
  }
}
