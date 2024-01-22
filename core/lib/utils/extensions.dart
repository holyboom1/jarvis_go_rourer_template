import 'package:flutter/material.dart';

export 'date_format_util.dart';
export 'string_extensions.dart';

extension KMBGeneratorExtension on int {
  String toKMB() {
    if (this >= 10000 && this < 100000) {
      return '${(this / 1000).toStringAsFixed(2)} K';
    } else if (this >= 100000 && this < 1000000) {
      return '${(this / 1000).toStringAsFixed(0)} K';
    } else if (this >= 1000000 && this < 1000000000) {
      return '${(this / 1000000).toStringAsFixed(0)} M';
    } else if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(0)} B';
    } else {
      return toString();
    }
  }
}

extension StatelessWidgetExtension on StatelessWidget {
  Widget testSemantics(String label) {
    return Semantics(
      label: label,
      container: true,
      child: this,
    );
  }
}

extension StatefulElementExtension on StatefulWidget {
  Widget testSemantics(String label) {
    return Semantics(
      label: label,
      child: this,
    );
  }
}

extension RowExtension on Row {
  Widget testSemantics(String label) {
    return Semantics(
      label: label,
      child: this,
    );
  }
}