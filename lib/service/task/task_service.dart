import 'dart:async';

import 'package:dio/dio.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/network/todo_list_api_dio.dart';

class TaskService {
  Future<List<TaskDto>?> getList() async {
    List<TaskDto>? dataList;

    Response<List<dynamic>> res = await TodoListApi.getApiDio().get<List<dynamic>>('/api/task/user/1');

    if (res.data != null) {
      final body = res.data as List;
      dataList = body.map((e) => TaskDto.fromJson(e)).toList();
    }

    return dataList;
  }

  Future<void> add(TaskDto task) async {
    await TodoListApi.getApiDio().post('/api/task',
        data: task
    );
  }

}