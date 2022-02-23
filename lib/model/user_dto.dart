import 'package:todo_list/model/task_dto.dart';

class UserDto {
  String photoUrl;
  String name;
  String role;
  int followers;
  int followings;
  List<TaskDto> taskList;

  UserDto(this.photoUrl, this.name, this.role, this.followers, this.followings, this.taskList);
}