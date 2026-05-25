import 'dart:ui';

import '../../../shared/models/base/cad_entity.dart';

abstract class EntityRenderer {
  String get entityType;

  void render(
    Canvas canvas,
    CadEntity entity,
    Paint paint,
    double scale,
  );
}
