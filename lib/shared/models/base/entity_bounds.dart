import 'package:flutter/material.dart';

class EntityBounds {

  double minX;

  double minY;

  double maxX;

  double maxY;

  EntityBounds({
    required this.minX,
    required this.minY,
    required this.maxX,
    required this.maxY,
  });

  factory EntityBounds.empty() {

    return EntityBounds(
      minX: double.infinity,
      minY: double.infinity,
      maxX: -double.infinity,
      maxY: -double.infinity,
    );
  }

  void expand(Rect rect) {

    minX = rect.left < minX
        ? rect.left
        : minX;

    minY = rect.top < minY
        ? rect.top
        : minY;

    maxX = rect.right > maxX
        ? rect.right
        : maxX;

    maxY = rect.bottom > maxY
        ? rect.bottom
        : maxY;
  }

  Rect toRect() {

    return Rect.fromLTRB(
      minX,
      minY,
      maxX,
      maxY,
    );
  }
}