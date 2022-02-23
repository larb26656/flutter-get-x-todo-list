import 'package:flutter/material.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';

class TextIndicatorCard extends StatelessWidget {

  final String label;

  const TextIndicatorCard({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorPalettes.grey,
      padding: const EdgeInsets.all(Dimensions.spacePadding3),
      child: Text(label),
    );
  }
}
