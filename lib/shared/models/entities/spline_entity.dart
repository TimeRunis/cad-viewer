import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class SplineEntity extends CadEntity {
  @override
  String get entityType => "SPLINE";

  final int degree;

  final bool closed;

  final List<double> knots;

  final List<CadPoint> controlPoints;

  const SplineEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.degree,
    required this.closed,
    required this.knots,
    required this.controlPoints,
  });

  @override
  Rect get bounds {
    if (controlPoints.isEmpty) {
      return Rect.zero;
    }

    double minX = controlPoints.first.x;
    double minY = controlPoints.first.y;

    double maxX = controlPoints.first.x;
    double maxY = controlPoints.first.y;

    for (final p in controlPoints) {
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
