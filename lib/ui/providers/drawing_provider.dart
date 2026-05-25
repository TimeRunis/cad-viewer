import 'package:flutter/material.dart';

import '../../features/2d_viewer/impl/repositories/drawing_repository_impl.dart';
import '../../shared/models/document/cad_document.dart';

class DrawingProvider extends ChangeNotifier {
  final DrawingRepositoryImpl _repo = DrawingRepositoryImpl();

  CadDocument? _document;

  bool _isLoading = false;

  String? _error;

  CadDocument? get document => _document;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadFile(String path) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _document = await _repo.loadDrawing(path);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}