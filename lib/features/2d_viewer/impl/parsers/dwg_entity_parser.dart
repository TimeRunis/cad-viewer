import '../../../../shared/models/base/cad_entity.dart';

import 'parser_registry_builder.dart';

class DwgEntityParser {

  final _registry =
      ParserRegistryBuilder.build();

  CadEntity? parse(
    Map<String, dynamic> json,
  ) {

    final type =
        json['entity'];

    if (type == null) {
      return null;
    }

    final parser =
        _registry[type];

    if (parser == null) {

      // print(
      //   '[Parser] Unsupported entity: $type',
      // );

      return null;
    }

    try {

      return parser(json);

    } catch (e, stack) {

      print(
        '[Parser] Error parsing $type',
      );

      print(e);

      print(stack);

      return null;
    }
  }
}