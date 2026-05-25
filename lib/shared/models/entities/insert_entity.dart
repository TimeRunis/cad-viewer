import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class InsertEntity extends CadEntity {
  @override
  String get entityType => "INSERT";

  final String blockHandle;

  final CadPoint insertionPoint;

  final double rotation;

  final CadPoint scale;

  const InsertEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.blockHandle,
    required this.insertionPoint,
    required this.rotation,
    required this.scale,
  });

  @override
  Rect get bounds {
    // INSERT 本身无法确定 bounds
    // 后续由 block 展开后计算
    return Rect.fromLTWH(
      insertionPoint.x,
      insertionPoint.y,
      1,
      1,
    );
  }
}
