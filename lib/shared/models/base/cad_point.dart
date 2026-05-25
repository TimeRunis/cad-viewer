import 'package:flutter/material.dart';

class CadPoint {

  final double x;

  final double y;

  final double z;

  const CadPoint(
    this.x,
    this.y, [
    this.z = 0,
  ]);

  factory CadPoint.fromList(
    List<dynamic> list,
  ) {

    return CadPoint(

      (list[0] as num).toDouble(),

      (list[1] as num).toDouble(),

      list.length > 2
          ? (list[2] as num).toDouble()
          : 0,
    );
  }

  Offset toOffset() {
    return Offset(x, y);
  }
}