import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/model/user_dto.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  int? id;
  String? topic;
  String? description;
  DateTime? date;
  UserDto? user;

  TaskDto(this.id, this.topic, this.description, this.date, this.user);

  TaskDto.fromEmpty();

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}