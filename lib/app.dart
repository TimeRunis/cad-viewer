import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'ui/pages/viewer_page.dart';

class CADViewerApp extends StatelessWidget {
  const CADViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAD Viewer',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const ViewerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}