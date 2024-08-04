// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Due _$DueFromJson(Map<String, dynamic> json) {
  return _Due.fromJson(json);
}

/// @nodoc
mixin _$Due {
  String get date => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String get datetime => throw _privateConstructorUsedError;
  String get string => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DueCopyWith<Due> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DueCopyWith<$Res> {
  factory $DueCopyWith(Due value, $Res Function(Due) then) =
      _$DueCopyWithImpl<$Res, Due>;
  @useResult
  $Res call(
      {String date,
      bool isRecurring,
      String datetime,
      String string,
      String timezone});
}

/// @nodoc
class _$DueCopyWithImpl<$Res, $Val extends Due> implements $DueCopyWith<$Res> {
  _$DueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isRecurring = null,
    Object? datetime = null,
    Object? string = null,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      string: null == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DueImplCopyWith<$Res> implements $DueCopyWith<$Res> {
  factory _$$DueImplCopyWith(_$DueImpl value, $Res Function(_$DueImpl) then) =
      __$$DueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      bool isRecurring,
      String datetime,
      String string,
      String timezone});
}

/// @nodoc
class __$$DueImplCopyWithImpl<$Res> extends _$DueCopyWithImpl<$Res, _$DueImpl>
    implements _$$DueImplCopyWith<$Res> {
  __$$DueImplCopyWithImpl(_$DueImpl _value, $Res Function(_$DueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isRecurring = null,
    Object? datetime = null,
    Object? string = null,
    Object? timezone = null,
  }) {
    return _then(_$DueImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      string: null == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DueImpl implements _Due {
  const _$DueImpl(
      {required this.date,
      required this.isRecurring,
      required this.datetime,
      required this.string,
      required this.timezone});

  factory _$DueImpl.fromJson(Map<String, dynamic> json) =>
      _$$DueImplFromJson(json);

  @override
  final String date;
  @override
  final bool isRecurring;
  @override
  final String datetime;
  @override
  final String string;
  @override
  final String timezone;

  @override
  String toString() {
    return 'Due(date: $date, isRecurring: $isRecurring, datetime: $datetime, string: $string, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DueImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.string, string) || other.string == string) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, isRecurring, datetime, string, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DueImplCopyWith<_$DueImpl> get copyWith =>
      __$$DueImplCopyWithImpl<_$DueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DueImplToJson(
      this,
    );
  }
}

abstract class _Due implements Due {
  const factory _Due(
      {required final String date,
      required final bool isRecurring,
      required final String datetime,
      required final String string,
      required final String timezone}) = _$DueImpl;

  factory _Due.fromJson(Map<String, dynamic> json) = _$DueImpl.fromJson;

  @override
  String get date;
  @override
  bool get isRecurring;
  @override
  String get datetime;
  @override
  String get string;
  @override
  String get timezone;
  @override
  @JsonKey(ignore: true)
  _$$DueImplCopyWith<_$DueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
