import 'package:flutter/material.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/style/text_size.dart';

class ErrorRetry extends StatelessWidget {
  final String errorText;
  final GestureTapCallback? onRetry;
  final String? retryText;

  const ErrorRetry({Key? key, required this.errorText, this.onRetry, this.retryText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorText),
        const SizedBox(height: Dimensions.spacePadding3,),
        TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: ColorPalettes.secondary,
            padding: const EdgeInsets.all(Dimensions.spacePadding3),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: TextSize.t5Size),
          ),
          onPressed: onRetry,
          child: Text(retryText ?? 'Retry'),
        )
      ],
    );
  }
}
