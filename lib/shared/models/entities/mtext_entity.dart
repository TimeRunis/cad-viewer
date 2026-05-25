import 'dart:ui';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class MTextEntity extends CadEntity {
  @override
  String get entityType => "MTEXT";

  final CadPoint insertionPoint;

  final String text;

  final double textHeight;

  final double rotation;

  MTextEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.insertionPoint,
    required this.text,
    required this.textHeight,
    required this.rotation,
  });

  @override
  Rect get bounds {
    return Rect.fromLTWH(
      insertionPoint.x,
      insertionPoint.y,
      textHeight,
      textHeight,
    );
  }
}
