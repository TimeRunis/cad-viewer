import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../shared/models/base/cad_entity.dart';
import '../../../../shared/models/entities/mtext_entity.dart';

import '../entity_renderer.dart';

class MTextRenderer implements EntityRenderer {
  @override
  void render(
    Canvas canvas,
    CadEntity entity,
    Paint paint,
    double scale,
  ) {
    if (entity is! MTextEntity) {
      return;
    }

    final fontSize = math.max(
      2.0,
      entity.textHeight,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: entity.text,
        style: TextStyle(
          color: Colors.red,
          fontSize: fontSize,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: 1000,
    );

    canvas.save();

    canvas.translate(
      entity.insertionPoint.x,
      entity.insertionPoint.y,
    );

    // 抵消CAD全局Y翻转
    canvas.scale(
      1,
      -1,
    );

    textPainter.paint(
      canvas,
      Offset.zero,
    );

    // rotation
    canvas.rotate(
      -entity.rotation,
    );

    canvas.restore();
  }

  @override
  String get entityType => "MTEXT";
}
