// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      priority: json['priority'] as num?,
      content: json['content'] as String,
      description: json['description'] as String?,
      is_completed: json['is_completed'] as bool?,
      comment_count: (json['comment_count'] as num?)?.toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      duration: (json['duration'] as num?)?.toInt(),
      due: json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>),
      duration_unit: json['duration_unit'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
      'content': instance.content,
      'description': instance.description,
      'is_completed': instance.is_completed,
      'comment_count': instance.comment_count,
      'created_at': instance.created_at?.toIso8601String(),
      'duration': instance.duration,
      'due': instance.due,
      'duration_unit': instance.duration_unit,
    };
