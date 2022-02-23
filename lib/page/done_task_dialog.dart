import 'package:flutter/material.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/style/text_size.dart';

class DoneTaskDialog extends StatelessWidget {
  const DoneTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular((Dimensions.spacePadding3)))),
      content: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Text('Are you sure to done this task ?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.spacePadding3)
            ),
            backgroundColor: ColorPalettes.primary,
            padding: const EdgeInsets.all(Dimensions.spacePadding3),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: TextSize.t5Size),
          ),
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.spacePadding3)
            ),
            padding: const EdgeInsets.all(Dimensions.spacePadding3),
            primary: Colors.black,
            textStyle: const TextStyle(fontSize: TextSize.t5Size),
          ),
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
