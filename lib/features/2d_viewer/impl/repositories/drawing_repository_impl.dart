import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import '../../../../shared/models/document/cad_document.dart';

import '../parsers/dwg_parser.dart';

typedef NativeParse = Int32 Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
);

typedef DartParse = int Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
);

class DrawingRepositoryImpl {

  late final DynamicLibrary _lib;

  late final DartParse _parse;

  final DwgParser _parser =
      DwgParser();

  DrawingRepositoryImpl() {

    _lib = DynamicLibrary.open(
      'liblibredwg.so',
    );

    _parse = _lib
        .lookup<
            NativeFunction<
                NativeParse>>(
          'dwg_to_json_file',
        )
        .asFunction();
  }

  Future<CadDocument> loadDrawing(
    String path,
  ) async {

    final outputPath =
        '${Directory.systemTemp.path}/temp_dwg.json';

    final inputPtr =
        path.toNativeUtf8();

    final outputPtr =
        outputPath.toNativeUtf8();

    try {

      final result = _parse(
        inputPtr,
        outputPtr,
      );

      print(
        '[Repository] native result: $result',
      );

      if (result != 0) {

        throw Exception(
          'LibreDWG parse failed: $result',
        );
      }

      final file =
          File(outputPath);

      if (!await file.exists()) {

        throw Exception(
          'JSON output file not found',
        );
      }

      final jsonStr =
          await file.readAsString();

      print(
        '[Repository] JSON size: ${jsonStr.length}',
      );

      if (jsonStr.isEmpty) {

        throw Exception(
          'Empty DWG JSON',
        );
      }

      // 调试JSON结构
      try {

        final decoded =
            jsonDecode(jsonStr);

        if (decoded
            is Map<String, dynamic>) {

          print(
            '[Repository] JSON keys: ${decoded.keys.toList()}',
          );

          final objects =
              decoded['OBJECTS'];

          if (objects is List) {

            print(
              '[Repository] OBJECTS count: ${objects.length}',
            );
          }
        }

      } catch (_) {}

      final document =
          _parser.parse(jsonStr);

      print(
        '[Repository] Parsed entities: ${document.entities.length}',
      );

      return document;

    } finally {

      malloc.free(inputPtr);

      malloc.free(outputPtr);
    }
  }
}