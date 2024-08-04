// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'due.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DueImpl _$$DueImplFromJson(Map<String, dynamic> json) => _$DueImpl(
      date: json['date'] as String,
      isRecurring: json['isRecurring'] as bool,
      datetime: json['datetime'] as String,
      string: json['string'] as String,
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$$DueImplToJson(_$DueImpl instance) => <String, dynamic>{
      'date': instance.date,
      'isRecurring': instance.isRecurring,
      'datetime': instance.datetime,
      'string': instance.string,
      'timezone': instance.timezone,
    };
