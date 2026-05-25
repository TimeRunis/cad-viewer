class MTextFormatter {
  static String clean(
    String input,
  ) {
    var text = input;

    // 换行
    text = text.replaceAll(
      r'\P',
      '\n',
    );

    // 对齐
    text = text.replaceAll(
      RegExp(r'\\A\d+;'),
      '',
    );

    // 颜色
    text = text.replaceAll(
      RegExp(r'\\C\d+;'),
      '',
    );

    // 字高
    text = text.replaceAll(
      RegExp(r'\\H[\d\.]+x;'),
      '',
    );

    // 字体
    text = text.replaceAll(
      RegExp(r'\\f[^;]+;'),
      '',
    );

    // 宽度
    text = text.replaceAll(
      RegExp(r'\\W[\d\.]+;'),
      '',
    );

    // 倾斜
    text = text.replaceAll(
      RegExp(r'\\Q[\d\.]+;'),
      '',
    );

    // 下划线
    text = text.replaceAll(
      r'\L',
      '',
    );

    text = text.replaceAll(
      r'\l',
      '',
    );

    // 上划线
    text = text.replaceAll(
      r'\O',
      '',
    );

    text = text.replaceAll(
      r'\o',
      '',
    );

    // 大括号
    text = text.replaceAll(
      '{',
      '',
    );

    text = text.replaceAll(
      '}',
      '',
    );

    return text.trim();
  }
}
