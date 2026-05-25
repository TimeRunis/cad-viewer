import 'package:flutter/material.dart';

import '../../../shared/models/base/cad_entity.dart';

import 'renderer_registry.dart';

class CadPainter extends CustomPainter {
  final List<CadEntity> entities;

  final RendererRegistry registry;

  final double scale;

  final Offset offset;

  CadPainter({
    required this.entities,
    required this.registry,
    required this.scale,
    required this.offset,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    // 背景
    canvas.drawColor(
      Colors.white,
      BlendMode.src,
    );

    // 移动到屏幕中心
    canvas.translate(
      size.width / 2 + offset.dx,
      size.height / 2 + offset.dy,
    );

    // CAD坐标系：
    // Y轴向上
    canvas.scale(
      scale,
      -scale,
    );

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = (1 / scale).clamp(
        0.1,
        2.0,
      )
      ..style = PaintingStyle.stroke;

    for (final entity in entities) {
      final renderer = registry.get(
        entity.entityType,
      );

      if (renderer == null) {
        continue;
      }

      renderer.render(
        canvas,
        entity,
        paint,
        scale,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CadPainter oldDelegate,
  ) {
    return true;
  }
}
