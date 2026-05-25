import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/entity_bounds.dart';

import '../blocks/cad_block.dart';

class CadDocument {

  final List<CadEntity> entities;

  final Map<String, CadBlock> blocks;

  const CadDocument({
    required this.entities,
    required this.blocks,
  });

  Rect computeBounds() {

    final bounds =
        EntityBounds.empty();

    for (final entity in entities) {

      bounds.expand(
        entity.bounds,
      );
    }

    return bounds.toRect();
  }
}