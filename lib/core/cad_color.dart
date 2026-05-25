import 'package:flutter/material.dart';

class CadColor {
  static Color fromAcadColor(int color) {
    switch (color) {
      case 1:
        return Colors.red;

      case 2:
        return Colors.yellow;

      case 3:
        return Colors.green;

      case 4:
        return Colors.cyan;

      case 5:
        return Colors.blue;

      case 6:
        return Colors.pink;

      case 7:
        return Colors.white;

      case 8:
        return Colors.grey;

      case 251:
        return Colors.grey.shade700;

      case 256:
        return Colors.white;

      default:
        return Colors.white;
    }
  }
}