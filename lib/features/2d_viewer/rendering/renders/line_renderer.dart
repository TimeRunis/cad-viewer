import 'package:cad_viewer/shared/models/base/cad_entity.dart';
import 'package:cad_viewer/shared/models/entities/line_entity.dart';
import 'package:flutter/material.dart';

import '../entity_renderer.dart';

class LineRenderer implements EntityRenderer {
  @override
  String get entityType => 'LINE';

  @override
  void render(
    Canvas canvas,
    CadEntity entity,
    Paint paint,
    double scale,
  ) {
    if (entity is! LineEntity) {
      return;
    }
    canvas.drawLine(
      Offset(
        entity.start.x,
        entity.start.y,
      ),
      Offset(
        entity.end.x,
        entity.end.y,
      ),
      paint,
    );
  }
}
