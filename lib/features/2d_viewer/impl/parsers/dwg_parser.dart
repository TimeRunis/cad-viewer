import 'dart:convert';

import 'package:cad_viewer/features/2d_viewer/impl/dwg_insert_resolver.dart';
import 'package:cad_viewer/features/2d_viewer/impl/parsers/dwg_block_builder.dart';
import 'package:cad_viewer/features/2d_viewer/impl/parsers/dwg_entity_parser.dart';

import '../../../../shared/models/base/cad_entity.dart';

import '../../../../shared/models/document/cad_document.dart';

class DwgParser {
  final DwgEntityParser _entityParser = DwgEntityParser();

  final DwgBlockBuilder _blockBuilder = DwgBlockBuilder();

  CadDocument parse(
    String jsonStr,
  ) {
    final dynamic decoded = jsonDecode(jsonStr);

    if (decoded is! Map) {
      throw Exception(
        'DWG JSON root must be object',
      );
    }

    final objects = decoded['OBJECTS'];

    if (objects is! List) {
      throw Exception(
        'Cannot find OBJECTS array in DWG JSON',
      );
    }

    print(
      '[Parser] OBJECTS count: ${objects.length}',
    );

    // =========================
    // 构建 BLOCK 定义
    // =========================

    final blocks = _blockBuilder.buildBlocks(
      objects,
    );

    print(
      '[Parser] BLOCKS count: ${blocks.length}',
    );

    // =========================
    // 解析实体
    // =========================

    final entities = <CadEntity>[];

    for (final raw in objects) {
      if (raw is! Map<String, dynamic>) {
        continue;
      }

      final entity = _entityParser.parse(raw);

      if (entity != null) {
        entities.add(entity);
      }
    }

    print(
      '[Parser] Parsed entities: ${entities.length}',
    );

    // =========================
    // INSERT 展开
    // =========================

    final resolved = DwgInsertResolver.resolve(
      entities,
      blocks,
    );

    print(
      '[Parser] Resolved entities: ${resolved.length}',
    );

    return CadDocument(
      entities: resolved,
      blocks: blocks,
    );
  }
}
