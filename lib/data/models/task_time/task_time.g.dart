// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTimeAdapter extends TypeAdapter<TaskTime> {
  @override
  final int typeId = 0;

  @override
  TaskTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskTime(
      taskId: fields[0] as String,
      startTime: fields[1] as DateTime,
      endTime: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskTime obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
