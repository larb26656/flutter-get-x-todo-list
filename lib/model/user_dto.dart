import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/model/task_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  int? id;
  String? photoUrl;
  String? name;
  String? role;
  int? followers;
  int? followings;
  List<TaskDto>? taskList;

  UserDto(this.photoUrl, this.name, this.role, this.followers, this.followings, this.taskList);

  UserDto.fromEmpty();

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}