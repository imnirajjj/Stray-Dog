// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailImpl _$$UserDetailImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailImpl(
      userDetailId: json['userDetailId'] as String,
      type: json['type'] as String,
      email: json['email'] as String,
      name: json['name'] as String? ?? '',
      photoUrl: json['photoUrl'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      doctorExperience: json['doctorExperience'] as String?,
      currentOrPreviousWorkPlace: json['currentOrPreviousWorkPlace'] as String?,
    );

Map<String, dynamic> _$$UserDetailImplToJson(_$UserDetailImpl instance) =>
    <String, dynamic>{
      'userDetailId': instance.userDetailId,
      'type': instance.type,
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'licenseNumber': instance.licenseNumber,
      'doctorExperience': instance.doctorExperience,
      'currentOrPreviousWorkPlace': instance.currentOrPreviousWorkPlace,
    };
