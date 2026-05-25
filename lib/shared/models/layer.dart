import 'dart:ui';

import 'package:flutter/material.dart';

class Layer {
  final String name;
  final bool isVisible;
  final Color color;

  Layer({
    required this.name,
    this.isVisible = true,
    this.color = Colors.white,
  });
}