// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  num? get priority => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get is_completed => throw _privateConstructorUsedError;
  int? get comment_count => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  Due? get due => throw _privateConstructorUsedError;
  String? get duration_unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      num? priority,
      String content,
      String? description,
      bool? is_completed,
      int? comment_count,
      DateTime? created_at,
      int? duration,
      Due? due,
      String? duration_unit});

  $DueCopyWith<$Res>? get due;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? priority = freezed,
    Object? content = null,
    Object? description = freezed,
    Object? is_completed = freezed,
    Object? comment_count = freezed,
    Object? created_at = freezed,
    Object? duration = freezed,
    Object? due = freezed,
    Object? duration_unit = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as num?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      is_completed: freezed == is_completed
          ? _value.is_completed
          : is_completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment_count: freezed == comment_count
          ? _value.comment_count
          : comment_count // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as Due?,
      duration_unit: freezed == duration_unit
          ? _value.duration_unit
          : duration_unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DueCopyWith<$Res>? get due {
    if (_value.due == null) {
      return null;
    }

    return $DueCopyWith<$Res>(_value.due!, (value) {
      return _then(_value.copyWith(due: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      num? priority,
      String content,
      String? description,
      bool? is_completed,
      int? comment_count,
      DateTime? created_at,
      int? duration,
      Due? due,
      String? duration_unit});

  @override
  $DueCopyWith<$Res>? get due;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? priority = freezed,
    Object? content = null,
    Object? description = freezed,
    Object? is_completed = freezed,
    Object? comment_count = freezed,
    Object? created_at = freezed,
    Object? duration = freezed,
    Object? due = freezed,
    Object? duration_unit = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as num?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      is_completed: freezed == is_completed
          ? _value.is_completed
          : is_completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment_count: freezed == comment_count
          ? _value.comment_count
          : comment_count // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as Due?,
      duration_unit: freezed == duration_unit
          ? _value.duration_unit
          : duration_unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      this.priority,
      required this.content,
      this.description,
      required this.is_completed,
      required this.comment_count,
      required this.created_at,
      this.duration,
      this.due,
      this.duration_unit});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final num? priority;
  @override
  final String content;
  @override
  final String? description;
  @override
  final bool? is_completed;
  @override
  final int? comment_count;
  @override
  final DateTime? created_at;
  @override
  final int? duration;
  @override
  final Due? due;
  @override
  final String? duration_unit;

  @override
  String toString() {
    return 'Task(id: $id, priority: $priority, content: $content, description: $description, is_completed: $is_completed, comment_count: $comment_count, created_at: $created_at, duration: $duration, due: $due, duration_unit: $duration_unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.is_completed, is_completed) ||
                other.is_completed == is_completed) &&
            (identical(other.comment_count, comment_count) ||
                other.comment_count == comment_count) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.duration_unit, duration_unit) ||
                other.duration_unit == duration_unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      priority,
      content,
      description,
      is_completed,
      comment_count,
      created_at,
      duration,
      due,
      duration_unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      final num? priority,
      required final String content,
      final String? description,
      required final bool? is_completed,
      required final int? comment_count,
      required final DateTime? created_at,
      final int? duration,
      final Due? due,
      final String? duration_unit}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  num? get priority;
  @override
  String get content;
  @override
  String? get description;
  @override
  bool? get is_completed;
  @override
  int? get comment_count;
  @override
  DateTime? get created_at;
  @override
  int? get duration;
  @override
  Due? get due;
  @override
  String? get duration_unit;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
