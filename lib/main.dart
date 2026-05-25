import 'package:cad_viewer/app.dart';
import 'package:cad_viewer/features/2d_viewer/rendering/renderer_bootstrap.dart';
import 'package:cad_viewer/features/2d_viewer/rendering/renderer_registry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/providers/drawing_provider.dart';
import 'ui/providers/viewport_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => DrawingProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ViewportProvider(),
        ),

        Provider<RendererRegistry>(
          create: (_) => RendererBootstrap.build(),
        ),
      ],

      child: const CADViewerApp(),
    ),
  );
}