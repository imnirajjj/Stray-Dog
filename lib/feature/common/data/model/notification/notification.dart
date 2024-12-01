import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String notificationId,
    required String userId,
    AdoptionRequest? adoptionRequest,
    DoctorRequest? doctorRequest,
    @Default(false) bool seen,
    dynamic timestamp,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
