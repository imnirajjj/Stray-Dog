// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      organizationName: json['organizationName'] as String,
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'organizationName': instance.organizationName,
      'username': instance.username,
      'passwordHash': instance.passwordHash,
      'phone': instance.phone,
      'location': instance.location,
      'email': instance.email,
    };
