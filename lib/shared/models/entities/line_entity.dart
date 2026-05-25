import 'package:flutter/material.dart';

import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class LineEntity extends CadEntity {
  @override
  String get entityType => "LINE";
  final CadPoint start;

  final CadPoint end;

  const LineEntity({
    required super.handle,
    required super.layer,
    required super.color,
    required this.start,
    required this.end,
  });

  @override
  Rect get bounds {
    return Rect.fromPoints(
      start.toOffset(),
      end.toOffset(),
    );
  }
}
