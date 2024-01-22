import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AppGrid extends StatelessWidget {
  final List<Widget> items;
  final int crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  const AppGrid({
    this.items = const <Widget>[],
    this.crossAxisCount = 2,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing ?? AppDimens.padding8.r,
      mainAxisSpacing: mainAxisSpacing ?? AppDimens.padding8.r,
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
    ;
  }
}
