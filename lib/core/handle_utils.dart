class HandleUtils {

  static String normalize(
    dynamic handle,
  ) {

    if (handle == null) {
      return '';
    }

    // LibreDWG handle array
    if (handle is List &&
        handle.isNotEmpty) {

      return handle.last
          .toString();
    }

    return handle.toString();
  }
}