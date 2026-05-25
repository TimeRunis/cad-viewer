import 'package:flutter/material.dart';

class ViewportProvider extends ChangeNotifier {
  double _scale = 1.0;

  Offset _offset = Offset.zero;

  double get scale => _scale;

  Offset get offset => _offset;

  void pan(
    Offset delta,
  ) {
    _offset += delta;

    notifyListeners();
  }

  void zoom(
    double scaleFactor, {
    required Offset focalPoint,
    required Size canvasSize,
  }) {
    const sensitivity = 0.1;

    final adjustedFactor = 1.0 + (scaleFactor - 1.0) * sensitivity;

    final oldScale = _scale;

    final newScale = (_scale * adjustedFactor).clamp(
      0.02,
      500.0,
    );

    // 画布中心
    final canvasCenter = Offset(
      canvasSize.width / 2,
      canvasSize.height / 2,
    );

    // focal 转换到世界坐标
    final worldBefore = (focalPoint - canvasCenter - _offset) / oldScale;

    _scale = newScale;

    final worldAfter = worldBefore * newScale;

    _offset = focalPoint - canvasCenter - worldAfter;

    notifyListeners();
  }

  void reset() {
    _scale = 1.0;

    _offset = Offset.zero;

    notifyListeners();
  }
}
