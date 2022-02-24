// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['photoUrl'] as String?,
      json['name'] as String?,
      json['role'] as String?,
      json['followers'] as int?,
      json['followings'] as int?,
      (json['taskList'] as List<dynamic>?)
          ?.map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id = json['id'] as int?;

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'role': instance.role,
      'followers': instance.followers,
      'followings': instance.followings,
      'taskList': instance.taskList,
    };
