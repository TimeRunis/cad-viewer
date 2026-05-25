class JsonReader {
  static String getString(
    Map<String, dynamic> json,
    String key, [
    String defaultValue = '',
  ]) {
    final value = json[key];

    if (value == null) {
      return defaultValue;
    }

    return value.toString();
  }

  static int getInt(
    Map<String, dynamic> json,
    String key, [
    int defaultValue = 0,
  ]) {
    final value = json[key];

    if (value == null) {
      return defaultValue;
    }

    return value is int
        ? value
        : int.tryParse(value.toString()) ?? defaultValue;
  }

  static double getDouble(
    Map<String, dynamic> json,
    String key, [
    double defaultValue = 0,
  ]) {
    final value = json[key];

    if (value == null) {
      return defaultValue;
    }

    return value is double
        ? value
        : double.tryParse(value.toString()) ?? defaultValue;
  }

  static List<dynamic> getList(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];

    if (value is List) {
      return value;
    }

    return [];
  }
}