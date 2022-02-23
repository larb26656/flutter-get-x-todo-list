import 'package:flutter/material.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';

class TaskCard extends StatelessWidget {
  final GestureTapCallback? onTaskTap;
  final GestureTapCallback? onDoneTap;
  final TaskDto task;

  const TaskCard({Key? key, this.onTaskTap, this.onDoneTap, required this.task }) : super(key: key);

  Widget _taskDetail() {
    return InkWell(
      onTap: onTaskTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          vertical: Dimensions.spacePadding4,
          horizontal: Dimensions.spacePadding6,
        ),
        color: ColorPalettes.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.topic,
              style: const TextStyle(
                  color: ColorPalettes.light
              ),),
            const SizedBox(
              height: Dimensions.spacePadding2,
            ),
            Text('Date : ${task.date}',
                style: const TextStyle(
                    color: ColorPalettes.light
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _doneTaskBtn() {
    return InkWell(
      onTap: onDoneTap,
      child: Ink(
        padding: const EdgeInsets.all(Dimensions.spacePadding4),
        color: ColorPalettes.secondary,
        child: const Center(
          child: Text('Done', style: TextStyle(
              color: ColorPalettes.light
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: _taskDetail()),
          _doneTaskBtn()
        ],
      ),
    );
  }
}
