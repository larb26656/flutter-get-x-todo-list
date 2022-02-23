import 'dart:async';

import 'package:todo_list/model/task_dto.dart';

class TaskService {
  final List<TaskDto> _taskList = [];

  Future<List<TaskDto>> getList() async {
    // TODO call api
    await Future.delayed(const Duration(seconds: 1), (){});
    return Future.value(_taskList);
  }

  Future<void> add(TaskDto task) async {
    // TODO call api
    await Future.delayed(const Duration(seconds: 1), (){});
    _taskList.add(task);
  }

}