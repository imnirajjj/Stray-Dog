// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      notificationId: json['notificationId'] as String,
      userId: json['userId'] as String,
      adoptionRequest: json['adoptionRequest'] == null
          ? null
          : AdoptionRequest.fromJson(
              json['adoptionRequest'] as Map<String, dynamic>),
      doctorRequest: json['doctorRequest'] == null
          ? null
          : DoctorRequest.fromJson(
              json['doctorRequest'] as Map<String, dynamic>),
      seen: json['seen'] as bool? ?? false,
      timestamp: json['timestamp'],
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'userId': instance.userId,
      'adoptionRequest': instance.adoptionRequest?.toJson(),
      'doctorRequest': instance.doctorRequest?.toJson(),
      'seen': instance.seen,
      'timestamp': instance.timestamp,
    };
