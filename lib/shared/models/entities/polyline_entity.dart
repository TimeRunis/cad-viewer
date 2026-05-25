import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class PolylineEntity extends CadEntity {
  @override
  String get entityType => "POLYLINE";

  final List<CadPoint> vertices;

  final List<double> bulges;

  final bool closed;

  const PolylineEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.vertices,
    required this.bulges,
    required this.closed,
  });

  @override
  Rect get bounds {
    if (vertices.isEmpty) {
      return Rect.zero;
    }

    double minX = vertices.first.x;
    double minY = vertices.first.y;

    double maxX = vertices.first.x;
    double maxY = vertices.first.y;

    for (final p in vertices) {
      if (p.x < minX) minX = p.x;
      if (p.y < minY) minY = p.y;

      if (p.x > maxX) maxX = p.x;
      if (p.y > maxY) maxY = p.y;
    }

    return Rect.fromLTRB(
      minX,
      minY,
      maxX,
      maxY,
    );
  }
}
