import '../../../shared/models/entities/arc_entity.dart';
import '../../../shared/models/entities/circle_entity.dart';
import '../../../shared/models/entities/line_entity.dart';
import '../../../shared/models/entities/lwpolyline_entity.dart';
import '../../../shared/models/entities/mtext_entity.dart';
import '../../../shared/models/entities/spline_entity.dart';
import '../../../shared/models/entities/text_entity.dart';

import 'renderer_registry.dart';

import 'renders/arc_renderer.dart';
import 'renders/circle_renderer.dart';
import 'renders/line_renderer.dart';
import 'renders/mtext_renderer.dart';
import 'renders/polyline_renderer.dart';
import 'renders/text_renderer.dart';

class RendererBootstrap {
  static RendererRegistry build() {
    final registry = RendererRegistry();

    registry.register(
      LineRenderer(),
    );

    registry.register(
      CircleRenderer(),
    );

    registry.register(
      ArcRenderer(),
    );

    registry.register(
      PolylineRenderer(),
    );

    registry.register(
      TextRenderer(),
    );

    registry.register(
      MTextRenderer(),
    );

    return registry;
  }
}
