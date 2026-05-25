import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../shared/models/base/cad_entity.dart';
import '../../../../shared/models/entities/text_entity.dart';

import '../entity_renderer.dart';

class TextRenderer implements EntityRenderer {
  @override
  void render(
    Canvas canvas,
    CadEntity entity,
    Paint paint,
    double scale,
  ) {
    if (entity is! TextEntity) {
      return;
    }

    final fontSize = math.max(
      2.0,
      entity.height,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: entity.text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: fontSize,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    canvas.save();

    // 到文字位置
    canvas.translate(
      entity.insertionPoint.x,
      entity.insertionPoint.y,
    );

    // 抵消全局Y翻转
    canvas.scale(
      1,
      -1,
    );

    // rotation
    canvas.rotate(
      -entity.rotation,
    );

    textPainter.paint(
      canvas,
      Offset(
        0,
        -textPainter.height,
      ),
    );

    canvas.restore();
  }

  @override
  String get entityType => "TEXT";
}
