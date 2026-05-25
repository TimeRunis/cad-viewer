import 'package:cad_viewer/shared/models/base/cad_entity.dart';
import 'package:cad_viewer/shared/models/entities/polyline_entity.dart';
import 'package:flutter/material.dart';

import '../entity_renderer.dart';

class PolylineRenderer implements EntityRenderer {
  @override
  String get entityType => 'POLYLINE';

  @override
  void render(
    Canvas canvas,
    CadEntity e,
    Paint paint,
    double scale,
  ) {
    if (e is! PolylineEntity) {
      return;
    }

    if (e.vertices.length < 2) {
      return;
    }

    for (int i = 0; i < e.vertices.length - 1; i++) {
      final p1 = e.vertices[i];

      final p2 = e.vertices[i + 1];

      canvas.drawLine(
        Offset(p1.x, p1.y),
        Offset(p2.x, p2.y),
        paint,
      );
    }

    if (e.closed) {
      final first = e.vertices.first;

      final last = e.vertices.last;

      canvas.drawLine(
        Offset(last.x, last.y),
        Offset(first.x, first.y),
        paint,
      );
    }
  }
}
