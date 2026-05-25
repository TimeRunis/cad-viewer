import 'entity_renderer.dart';

class RendererRegistry {

  final Map<String, EntityRenderer>
      _renderers = {};

  void register(
    EntityRenderer renderer,
  ) {

    _renderers[
        renderer.entityType] =
        renderer;
  }

  EntityRenderer? get(
    String type,
  ) {

    return _renderers[type];
  }
}