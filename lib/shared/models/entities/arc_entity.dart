import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class ArcEntity extends CadEntity {
  @override
  String get entityType => "ARC";

  final CadPoint center;

  final double radius;

  final double startAngle;

  final double endAngle;

  const ArcEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.center,
    required this.radius,
    required this.startAngle,
    required this.endAngle,
  });

  @override
  Rect get bounds {
    return Rect.fromCircle(
      center: center.toOffset(),
      radius: radius,
    );
  }
}
