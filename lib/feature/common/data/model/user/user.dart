import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    required String userDetailId,
    required String type,
    required String email,
    @Default('') String name,
    String? photoUrl,
    String? licenseNumber,
    String? doctorExperience,
    String? currentOrPreviousWorkPlace,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, Object?> json) =>
      _$UserDetailFromJson(json);
}
