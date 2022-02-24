// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      json['id'] as int?,
      json['topic'] as String?,
      json['description'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'user': instance.user,
    };
