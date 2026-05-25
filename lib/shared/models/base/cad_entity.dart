import 'package:flutter/material.dart';

abstract class CadEntity {
  final String handle;

  final String layer;

  final int color;

  String get entityType;

  const CadEntity({
    required this.handle,
    required this.layer,
    required this.color,
  });

  Rect get bounds;
}
