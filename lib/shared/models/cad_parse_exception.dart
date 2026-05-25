class CadParseException implements Exception {

  final String message;

  CadParseException(this.message);

  @override
  String toString() {
    return 'CadParseException: $message';
  }
}