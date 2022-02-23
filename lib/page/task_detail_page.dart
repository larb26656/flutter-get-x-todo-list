import 'package:flutter/material.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/page/done_task_dialog.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/widget/task_card.dart';

class TaskDetailPage extends StatelessWidget {
  final TaskDto task;
  const TaskDetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Task Detail'
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TaskCard(
              task: task,
            onDoneTap: () {
              showDialog<bool>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return const DoneTaskDialog();
                  }).then((value) {
                if (value != null) {
                  if (value) {
                    Navigator.pop(context, true);
                  }
                }
                return value;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimensions.spacePadding3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      task.description ?? '-'
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
