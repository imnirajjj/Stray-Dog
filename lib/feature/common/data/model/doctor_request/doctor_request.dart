import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';

part 'doctor_request.freezed.dart';
part 'doctor_request.g.dart';

@freezed
class DoctorRequest with _$DoctorRequest {
  const factory DoctorRequest({
    required String userId,
    required String doctorId,
    required String status, // Options: pending, accepted, rejected
    required String reason,
    required Decision adminDecision, // Nested AdminDecision object
    required Decision doctorDecision, // Nested DoctorDecision object
    required DateTime timestamp, // Timestamp field
  }) = _DoctorRequest;

  factory DoctorRequest.fromJson(Map<String, dynamic> json) =>
      _$DoctorRequestFromJson(json);
}
