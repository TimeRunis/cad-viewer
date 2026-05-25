import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class CircleEntity extends CadEntity {
  @override
  String get entityType => "CIRCLE";

  final CadPoint center;

  final double radius;

  const CircleEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.center,
    required this.radius,
  });

  @override
  Rect get bounds {
    return Rect.fromCircle(
      center: center.toOffset(),
      radius: radius,
    );
  }
}
