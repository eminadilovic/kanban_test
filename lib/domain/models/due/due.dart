import 'package:freezed_annotation/freezed_annotation.dart';

part 'due.freezed.dart';
part 'due.g.dart';

@freezed
class Due with _$Due {
  const factory Due({
    required String date,
    required bool isRecurring,
    required String datetime,
    required String string,
    required String timezone,
  }) = _Due;

  factory Due.fromJson(Map<String, dynamic> json) => _$DueFromJson(json);
}
