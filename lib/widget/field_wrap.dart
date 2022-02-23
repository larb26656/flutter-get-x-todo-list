import 'package:flutter/material.dart';
import 'package:todo_list/style/dimensions.dart';

class FieldWrap extends StatelessWidget {
  final String label;

  final Widget child;

  const FieldWrap({Key? key, required this.label, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label
        ),
        const SizedBox(
          height: Dimensions.spacePadding3,
        ),
        child
      ],
    );
  }
}
