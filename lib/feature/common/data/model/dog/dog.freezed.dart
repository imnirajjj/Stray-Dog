// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dog _$DogFromJson(Map<String, dynamic> json) {
  return _Dog.fromJson(json);
}

/// @nodoc
mixin _$Dog {
  String? get dogId => throw _privateConstructorUsedError;
  String? get organizationEmail => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get trait => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get adopted => throw _privateConstructorUsedError;
  List<String> get adoptionRequestUid => throw _privateConstructorUsedError;
  List<String> get acceptedUid => throw _privateConstructorUsedError;
  List<String> get rejectedUid => throw _privateConstructorUsedError;

  /// Serializes this Dog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DogCopyWith<Dog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogCopyWith<$Res> {
  factory $DogCopyWith(Dog value, $Res Function(Dog) then) =
      _$DogCopyWithImpl<$Res, Dog>;
  @useResult
  $Res call(
      {String? dogId,
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
      bool adopted,
      List<String> adoptionRequestUid,
      List<String> acceptedUid,
      List<String> rejectedUid});
}

/// @nodoc
class _$DogCopyWithImpl<$Res, $Val extends Dog> implements $DogCopyWith<$Res> {
  _$DogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dogId = freezed,
    Object? organizationEmail = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? type = freezed,
    Object? condition = freezed,
    Object? color = freezed,
    Object? weight = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? trait = freezed,
    Object? location = freezed,
    Object? adopted = null,
    Object? adoptionRequestUid = null,
    Object? acceptedUid = null,
    Object? rejectedUid = null,
  }) {
    return _then(_value.copyWith(
      dogId: freezed == dogId
          ? _value.dogId
          : dogId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationEmail: freezed == organizationEmail
          ? _value.organizationEmail
          : organizationEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      trait: freezed == trait
          ? _value.trait
          : trait // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      adopted: null == adopted
          ? _value.adopted
          : adopted // ignore: cast_nullable_to_non_nullable
              as bool,
      adoptionRequestUid: null == adoptionRequestUid
          ? _value.adoptionRequestUid
          : adoptionRequestUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      acceptedUid: null == acceptedUid
          ? _value.acceptedUid
          : acceptedUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rejectedUid: null == rejectedUid
          ? _value.rejectedUid
          : rejectedUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DogImplCopyWith<$Res> implements $DogCopyWith<$Res> {
  factory _$$DogImplCopyWith(_$DogImpl value, $Res Function(_$DogImpl) then) =
      __$$DogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dogId,
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
      bool adopted,
      List<String> adoptionRequestUid,
      List<String> acceptedUid,
      List<String> rejectedUid});
}

/// @nodoc
class __$$DogImplCopyWithImpl<$Res> extends _$DogCopyWithImpl<$Res, _$DogImpl>
    implements _$$DogImplCopyWith<$Res> {
  __$$DogImplCopyWithImpl(_$DogImpl _value, $Res Function(_$DogImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dogId = freezed,
    Object? organizationEmail = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? type = freezed,
    Object? condition = freezed,
    Object? color = freezed,
    Object? weight = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? trait = freezed,
    Object? location = freezed,
    Object? adopted = null,
    Object? adoptionRequestUid = null,
    Object? acceptedUid = null,
    Object? rejectedUid = null,
  }) {
    return _then(_$DogImpl(
      dogId: freezed == dogId
          ? _value.dogId
          : dogId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationEmail: freezed == organizationEmail
          ? _value.organizationEmail
          : organizationEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      trait: freezed == trait
          ? _value.trait
          : trait // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      adopted: null == adopted
          ? _value.adopted
          : adopted // ignore: cast_nullable_to_non_nullable
              as bool,
      adoptionRequestUid: null == adoptionRequestUid
          ? _value._adoptionRequestUid
          : adoptionRequestUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      acceptedUid: null == acceptedUid
          ? _value._acceptedUid
          : acceptedUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rejectedUid: null == rejectedUid
          ? _value._rejectedUid
          : rejectedUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DogImpl implements _Dog {
  const _$DogImpl(
      {required this.dogId,
      this.organizationEmail,
      this.uid,
      this.name,
      this.photoUrl,
      this.type,
      this.condition,
      this.color,
      this.weight,
      this.age,
      this.gender,
      this.trait,
      this.location,
      this.adopted = false,
      final List<String> adoptionRequestUid = const [],
      final List<String> acceptedUid = const [],
      final List<String> rejectedUid = const []})
      : _adoptionRequestUid = adoptionRequestUid,
        _acceptedUid = acceptedUid,
        _rejectedUid = rejectedUid;

  factory _$DogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DogImplFromJson(json);

  @override
  final String? dogId;
  @override
  final String? organizationEmail;
  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? photoUrl;
  @override
  final String? type;
  @override
  final String? condition;
  @override
  final String? color;
  @override
  final double? weight;
  @override
  final String? age;
  @override
  final String? gender;
  @override
  final String? trait;
  @override
  final String? location;
  @override
  @JsonKey()
  final bool adopted;
  final List<String> _adoptionRequestUid;
  @override
  @JsonKey()
  List<String> get adoptionRequestUid {
    if (_adoptionRequestUid is EqualUnmodifiableListView)
      return _adoptionRequestUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adoptionRequestUid);
  }

  final List<String> _acceptedUid;
  @override
  @JsonKey()
  List<String> get acceptedUid {
    if (_acceptedUid is EqualUnmodifiableListView) return _acceptedUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acceptedUid);
  }

  final List<String> _rejectedUid;
  @override
  @JsonKey()
  List<String> get rejectedUid {
    if (_rejectedUid is EqualUnmodifiableListView) return _rejectedUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejectedUid);
  }

  @override
  String toString() {
    return 'Dog(dogId: $dogId, organizationEmail: $organizationEmail, uid: $uid, name: $name, photoUrl: $photoUrl, type: $type, condition: $condition, color: $color, weight: $weight, age: $age, gender: $gender, trait: $trait, location: $location, adopted: $adopted, adoptionRequestUid: $adoptionRequestUid, acceptedUid: $acceptedUid, rejectedUid: $rejectedUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogImpl &&
            (identical(other.dogId, dogId) || other.dogId == dogId) &&
            (identical(other.organizationEmail, organizationEmail) ||
                other.organizationEmail == organizationEmail) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.trait, trait) || other.trait == trait) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.adopted, adopted) || other.adopted == adopted) &&
            const DeepCollectionEquality()
                .equals(other._adoptionRequestUid, _adoptionRequestUid) &&
            const DeepCollectionEquality()
                .equals(other._acceptedUid, _acceptedUid) &&
            const DeepCollectionEquality()
                .equals(other._rejectedUid, _rejectedUid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dogId,
      organizationEmail,
      uid,
      name,
      photoUrl,
      type,
      condition,
      color,
      weight,
      age,
      gender,
      trait,
      location,
      adopted,
      const DeepCollectionEquality().hash(_adoptionRequestUid),
      const DeepCollectionEquality().hash(_acceptedUid),
      const DeepCollectionEquality().hash(_rejectedUid));

  /// Create a copy of Dog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DogImplCopyWith<_$DogImpl> get copyWith =>
      __$$DogImplCopyWithImpl<_$DogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DogImplToJson(
      this,
    );
  }
}

abstract class _Dog implements Dog {
  const factory _Dog(
      {required final String? dogId,
      final String? organizationEmail,
      final String? uid,
      final String? name,
      final String? photoUrl,
      final String? type,
      final String? condition,
      final String? color,
      final double? weight,
      final String? age,
      final String? gender,
      final String? trait,
      final String? location,
      final bool adopted,
      final List<String> adoptionRequestUid,
      final List<String> acceptedUid,
      final List<String> rejectedUid}) = _$DogImpl;

  factory _Dog.fromJson(Map<String, dynamic> json) = _$DogImpl.fromJson;

  @override
  String? get dogId;
  @override
  String? get organizationEmail;
  @override
  String? get uid;
  @override
  String? get name;
  @override
  String? get photoUrl;
  @override
  String? get type;
  @override
  String? get condition;
  @override
  String? get color;
  @override
  double? get weight;
  @override
  String? get age;
  @override
  String? get gender;
  @override
  String? get trait;
  @override
  String? get location;
  @override
  bool get adopted;
  @override
  List<String> get adoptionRequestUid;
  @override
  List<String> get acceptedUid;
  @override
  List<String> get rejectedUid;

  /// Create a copy of Dog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DogImplCopyWith<_$DogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
