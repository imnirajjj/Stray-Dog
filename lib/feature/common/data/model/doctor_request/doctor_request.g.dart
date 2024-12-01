// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorRequestImpl _$$DoctorRequestImplFromJson(Map<String, dynamic> json) =>
    _$DoctorRequestImpl(
      userId: json['userId'] as String,
      doctorId: json['doctorId'] as String,
      status: json['status'] as String,
      reason: json['reason'] as String,
      adminDecision:
          Decision.fromJson(json['adminDecision'] as Map<String, dynamic>),
      doctorDecision:
          Decision.fromJson(json['doctorDecision'] as Map<String, dynamic>),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$DoctorRequestImplToJson(_$DoctorRequestImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'doctorId': instance.doctorId,
      'status': instance.status,
      'reason': instance.reason,
      'adminDecision': instance.adminDecision.toJson(),
      'doctorDecision': instance.doctorDecision.toJson(),
      'timestamp': instance.timestamp.toIso8601String(),
    };
