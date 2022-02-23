import 'package:flutter/material.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/style/text_size.dart';

class DashBoardTile extends StatelessWidget {
  final String value;
  final String label;


  const DashBoardTile({Key? key, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: TextSize.t6Size,
            color: ColorPalettes.primary
          ),
        ),
        SizedBox(
          height: Dimensions.spacePadding3,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: TextSize.t4Size
          ),
        )
      ],
    );
  }
}
