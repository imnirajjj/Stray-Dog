// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DogImpl _$$DogImplFromJson(Map<String, dynamic> json) => _$DogImpl(
      dogId: json['dogId'] as String?,
      organizationEmail: json['organizationEmail'] as String?,
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      type: json['type'] as String?,
      condition: json['condition'] as String?,
      color: json['color'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      trait: json['trait'] as String?,
      location: json['location'] as String?,
      adopted: json['adopted'] as bool? ?? false,
      adoptionRequestUid: (json['adoptionRequestUid'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      acceptedUid: (json['acceptedUid'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rejectedUid: (json['rejectedUid'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DogImplToJson(_$DogImpl instance) => <String, dynamic>{
      'dogId': instance.dogId,
      'organizationEmail': instance.organizationEmail,
      'uid': instance.uid,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'type': instance.type,
      'condition': instance.condition,
      'color': instance.color,
      'weight': instance.weight,
      'age': instance.age,
      'gender': instance.gender,
      'trait': instance.trait,
      'location': instance.location,
      'adopted': instance.adopted,
      'adoptionRequestUid': instance.adoptionRequestUid,
      'acceptedUid': instance.acceptedUid,
      'rejectedUid': instance.rejectedUid,
    };
