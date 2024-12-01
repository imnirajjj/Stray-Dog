// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdoptionRequestImpl _$$AdoptionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AdoptionRequestImpl(
      adoptionId: json['adoptionId'] as String,
      userId: json['userId'] as String,
      dogId: json['dogId'] as String,
      requestUserEmail: json['requestUserEmail'] as String,
      ownerUserId: json['ownerUserId'] as String,
      organizationDecision: Decision.fromJson(
          json['organizationDecision'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdoptionRequestImplToJson(
        _$AdoptionRequestImpl instance) =>
    <String, dynamic>{
      'adoptionId': instance.adoptionId,
      'userId': instance.userId,
      'dogId': instance.dogId,
      'requestUserEmail': instance.requestUserEmail,
      'ownerUserId': instance.ownerUserId,
      'organizationDecision': instance.organizationDecision.toJson(),
    };

_$DoctorRequestImpl _$$DoctorRequestImplFromJson(Map<String, dynamic> json) =>
    _$DoctorRequestImpl(
      doctorRequestId: json['doctorRequestId'] as String,
      requestUserEmail: json['requestUserEmail'] as String,
      requestUserId: json['requestUserId'] as String,
      doctorId: json['doctorId'] as String,
      doctorDecision:
          Decision.fromJson(json['doctorDecision'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DoctorRequestImplToJson(_$DoctorRequestImpl instance) =>
    <String, dynamic>{
      'doctorRequestId': instance.doctorRequestId,
      'requestUserEmail': instance.requestUserEmail,
      'requestUserId': instance.requestUserId,
      'doctorId': instance.doctorId,
      'doctorDecision': instance.doctorDecision.toJson(),
    };

_$DecisionImpl _$$DecisionImplFromJson(Map<String, dynamic> json) =>
    _$DecisionImpl(
      status: json['status'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$DecisionImplToJson(_$DecisionImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
    };
