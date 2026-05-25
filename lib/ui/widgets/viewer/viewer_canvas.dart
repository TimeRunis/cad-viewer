import 'package:cad_viewer/ui/providers/drawing_provider.dart';
import 'package:cad_viewer/ui/providers/viewport_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../features/2d_viewer/rendering/cad_painter.dart';
import '../../../../features/2d_viewer/rendering/renderer_registry.dart';

class ViewerCanvas extends StatefulWidget {
  const ViewerCanvas({
    super.key,
  });

  @override
  State<ViewerCanvas> createState() => _ViewerCanvasState();
}

class _ViewerCanvasState extends State<ViewerCanvas> {
  double _lastScale = 1.0;

  @override
  Widget build(
    BuildContext context,
  ) {
    final drawingProvider = context.watch<DrawingProvider>();

    final viewportProvider = context.watch<ViewportProvider>();

    final registry = context.read<RendererRegistry>();

    final document = drawingProvider.document;

    return GestureDetector(
      onScaleStart: (_) {
        _lastScale = 1.0;
      },
      onScaleUpdate: (details) {
        final vp = context.read<ViewportProvider>();

        // 双指缩放
        if (details.pointerCount >= 2) {
          final delta = details.scale / _lastScale;

          _lastScale = details.scale;

          vp.zoom(
            details.scale,
            focalPoint: details.localFocalPoint,
            canvasSize: context.size!,
          );
        }

        // 单指拖动
        else {
          vp.pan(
            details.focalPointDelta,
          );
        }
      },
      child: ClipRect(
        child: CustomPaint(
          size: Size.infinite,
          painter: CadPainter(
            entities: document?.entities ?? [],
            registry: registry,
            scale: viewportProvider.scale,
            offset: viewportProvider.offset,
          ),
        ),
      ),
    );
  }
}
