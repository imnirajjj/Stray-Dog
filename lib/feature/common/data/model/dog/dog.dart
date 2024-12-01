import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog.freezed.dart';
part 'dog.g.dart';

@freezed
class Dog with _$Dog {
  const factory Dog({
    required String? dogId,
    String? organizationEmail,
    String? uid,
    String? name,
    String? photoUrl,
    String? type,
    String? condition,
    String? color,
    double? weight,
    String? age,
    String? gender,
    String? trait,
    String? location,
    @Default(false) bool adopted,
    @Default([]) List<String> adoptionRequestUid,
    @Default([]) List<String> acceptedUid,
    @Default([]) List<String> rejectedUid,
  }) = _Dog;

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
}
