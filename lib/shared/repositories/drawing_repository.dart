import '../models/document/cad_document.dart';

abstract class DrawingRepository {
  Future<CadDocument> loadDrawing(
    String path,
  );
}