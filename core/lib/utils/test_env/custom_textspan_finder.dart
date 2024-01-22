import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findTextSpan(String text) {
  return find.byWidgetPredicate(
    (Widget widget) => widget is RichText && hasTextSpanWithText(widget, text),
  );
}

bool hasTextSpanWithText(RichText richText, String text) {
  final InlineSpan textSpan = richText.text;
  if (textSpan is TextSpan) {
    return textSpan.toPlainText().contains(text);
  }
  return false;
}
