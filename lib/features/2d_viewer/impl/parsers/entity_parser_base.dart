import 'package:cad_viewer/core/handle_utils.dart';

abstract class EntityParserBase {
  static String parseLayer(
    Map<String, dynamic> json,
  ) {
    final layer = json['layer'];

    // LibreDWG handle ref
    if (layer is List && layer.isNotEmpty) {
      return layer.last.toString();
    }

    if (layer is String) {
      return layer;
    }

    return '0';
  }

  static int parseColor(
    Map<String, dynamic> json,
  ) {
    final color = json['color'];

    if (color is int) {
      return color;
    }

    return 7;
  }

  static String parseHandle(
    Map<String, dynamic> json,
  ) {
    return HandleUtils.normalize(
      json['handle'],
    );
  }
}
