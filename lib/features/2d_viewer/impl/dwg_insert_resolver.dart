import 'dart:math' as math;

import '../../../../shared/models/base/cad_entity.dart';
import '../../../../shared/models/base/cad_point.dart';

import '../../../../shared/models/blocks/cad_block.dart';

import '../../../../shared/models/entities/arc_entity.dart';
import '../../../../shared/models/entities/circle_entity.dart';
import '../../../../shared/models/entities/insert_entity.dart';
import '../../../../shared/models/entities/line_entity.dart';
import '../../../../shared/models/entities/lwpolyline_entity.dart';
import '../../../../shared/models/entities/mtext_entity.dart';
import '../../../../shared/models/entities/spline_entity.dart';
import '../../../../shared/models/entities/text_entity.dart';

class DwgInsertResolver {
  static List<CadEntity> resolve(
    List<CadEntity> entities,
    Map<String, CadBlock> blocks,
  ) {
    final resolved = <CadEntity>[];

    for (final entity in entities) {
      if (entity is! InsertEntity) {
        resolved.add(entity);

        continue;
      }

      final block = blocks[entity.blockHandle];

      if (block == null) {
        print(
          '[INSERT] Missing block: ${entity.blockHandle}',
        );

        continue;
      }

      for (final child in block.entities) {
        final transformed = _transformEntity(
          child,
          insert: entity,
          block: block,
        );

        if (transformed != null) {
          resolved.add(
            transformed,
          );
        }
      }
    }

    return resolved;
  }

  static CadEntity? _transformEntity(
    CadEntity entity, {
    required InsertEntity insert,
    required CadBlock block,
  }) {
    if (entity is LineEntity) {
      return LineEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        start: _transformPoint(
          entity.start,
          insert,
          block,
        ),
        end: _transformPoint(
          entity.end,
          insert,
          block,
        ),
      );
    }

    if (entity is CircleEntity) {
      return CircleEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        center: _transformPoint(
          entity.center,
          insert,
          block,
        ),
        radius: entity.radius * insert.scale.x,
      );
    }

    if (entity is ArcEntity) {
      return ArcEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        center: _transformPoint(
          entity.center,
          insert,
          block,
        ),
        radius: entity.radius * insert.scale.x,
        startAngle: entity.startAngle + insert.rotation,
        endAngle: entity.endAngle + insert.rotation,
      );
    }

    if (entity is LWPolylineEntity) {
      return LWPolylineEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        vertices: entity.vertices
            .map(
              (e) => _transformPoint(
                e,
                insert,
                block,
              ),
            )
            .toList(),
        bulges: entity.bulges,
        closed: entity.closed,
      );
    }

    if (entity is TextEntity) {
      return TextEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        insertionPoint: _transformPoint(
          entity.insertionPoint,
          insert,
          block,
        ),
        text: entity.text,
        height: entity.height * insert.scale.x,
        rotation: entity.rotation + insert.rotation,
      );
    }

    if (entity is MTextEntity) {
      return MTextEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        insertionPoint: _transformPoint(
          entity.insertionPoint,
          insert,
          block,
        ),
        text: entity.text,
        textHeight: entity.textHeight * insert.scale.x,
        rotation: entity.rotation,
      );
    }

    if (entity is SplineEntity) {
      return SplineEntity(
        handle: entity.handle,
        layer: entity.layer,
        color: entity.color,
        controlPoints: entity.controlPoints
            .map(
              (e) => _transformPoint(
                e,
                insert,
                block,
              ),
            )
            .toList(),
        degree: entity.degree,
        closed: entity.closed,
        knots: entity.knots,
      );
    }

    return null;
  }

  static CadPoint _transformPoint(
    CadPoint point,
    InsertEntity insert,
    CadBlock block,
  ) {
    // BLOCK局部坐标
    final localX = point.x - block.basePoint.x;

    final localY = point.y - block.basePoint.y;

    // SCALE
    final scaledX = localX * insert.scale.x;

    final scaledY = localY * insert.scale.y;

    // ROTATE
    final cosr = math.cos(
      insert.rotation,
    );

    final sinr = math.sin(
      insert.rotation,
    );

    final rotatedX = scaledX * cosr - scaledY * sinr;

    final rotatedY = scaledX * sinr + scaledY * cosr;

    // TRANSLATE
    return CadPoint(
      rotatedX + insert.insertionPoint.x,
      rotatedY + insert.insertionPoint.y,
      point.z,
    );
  }
}
