import 'package:flutter/material.dart';

import '../../../../shared/models/base/cad_entity.dart';

import '../../../../shared/models/entities/arc_entity.dart';

import '../entity_renderer.dart';

class ArcRenderer implements EntityRenderer {
  @override
  String get entityType => 'ARC';

  @override
  void render(
    Canvas canvas,
    CadEntity entity,
    Paint paint,
    double scale,
  ) {
    if (entity is! ArcEntity) {
      return;
    }

    final rect = Rect.fromCircle(
      center: Offset(
        entity.center.x,
        entity.center.y,
      ),
      radius: entity.radius,
    );

    canvas.drawArc(
      rect,
      entity.startAngle,
      entity.endAngle - entity.startAngle,
      false,
      paint,
    );
  }
}
