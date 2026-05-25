import 'package:flutter/material.dart';

import '../../../../shared/models/base/cad_entity.dart';

import '../../../../shared/models/entities/circle_entity.dart';

import '../entity_renderer.dart';

class CircleRenderer implements EntityRenderer {
  @override
  String get entityType => 'CIRCLE';

  @override
  void render(
    Canvas canvas,
    CadEntity entity,
    Paint paint,
    double scale,
  ) {
    if (entity is! CircleEntity) {
      return;
    }

    canvas.drawCircle(
      Offset(
        entity.center.x,
        entity.center.y,
      ),
      entity.radius,
      paint,
    );
  }
}
