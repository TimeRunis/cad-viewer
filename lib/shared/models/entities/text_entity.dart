import 'dart:ui';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class TextEntity extends CadEntity {
  @override
  String get entityType => "TEXT";

  final CadPoint insertionPoint;

  final String text;

  final double height;

  final double rotation;

  TextEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.insertionPoint,
    required this.text,
    required this.height,
    required this.rotation,
  });

  @override
  Rect get bounds {
    return Rect.fromLTWH(
      insertionPoint.x,
      insertionPoint.y,
      height,
      height,
    );
  }
}
