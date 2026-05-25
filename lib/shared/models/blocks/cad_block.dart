import '../base/cad_entity.dart';
import '../base/cad_point.dart';

class CadBlock {

  final String handle;

  final String name;

  final CadPoint basePoint;

  final List<CadEntity> entities;

  const CadBlock({
    required this.handle,
    required this.name,
    required this.basePoint,
    required this.entities,
  });
}