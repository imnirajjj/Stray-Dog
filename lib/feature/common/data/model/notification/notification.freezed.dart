// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String get notificationId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  AdoptionRequest? get adoptionRequest => throw _privateConstructorUsedError;
  DoctorRequest? get doctorRequest => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;
  dynamic get timestamp => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String notificationId,
      String userId,
      AdoptionRequest? adoptionRequest,
      DoctorRequest? doctorRequest,
      bool seen,
      dynamic timestamp});

  $AdoptionRequestCopyWith<$Res>? get adoptionRequest;
  $DoctorRequestCopyWith<$Res>? get doctorRequest;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? userId = null,
    Object? adoptionRequest = freezed,
    Object? doctorRequest = freezed,
    Object? seen = null,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      adoptionRequest: freezed == adoptionRequest
          ? _value.adoptionRequest
          : adoptionRequest // ignore: cast_nullable_to_non_nullable
              as AdoptionRequest?,
      doctorRequest: freezed == doctorRequest
          ? _value.doctorRequest
          : doctorRequest // ignore: cast_nullable_to_non_nullable
              as DoctorRequest?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdoptionRequestCopyWith<$Res>? get adoptionRequest {
    if (_value.adoptionRequest == null) {
      return null;
    }

    return $AdoptionRequestCopyWith<$Res>(_value.adoptionRequest!, (value) {
      return _then(_value.copyWith(adoptionRequest: value) as $Val);
    });
  }

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorRequestCopyWith<$Res>? get doctorRequest {
    if (_value.doctorRequest == null) {
      return null;
    }

    return $DoctorRequestCopyWith<$Res>(_value.doctorRequest!, (value) {
      return _then(_value.copyWith(doctorRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      String userId,
      AdoptionRequest? adoptionRequest,
      DoctorRequest? doctorRequest,
      bool seen,
      dynamic timestamp});

  @override
  $AdoptionRequestCopyWith<$Res>? get adoptionRequest;
  @override
  $DoctorRequestCopyWith<$Res>? get doctorRequest;
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? userId = null,
    Object? adoptionRequest = freezed,
    Object? doctorRequest = freezed,
    Object? seen = null,
    Object? timestamp = freezed,
  }) {
    return _then(_$NotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      adoptionRequest: freezed == adoptionRequest
          ? _value.adoptionRequest
          : adoptionRequest // ignore: cast_nullable_to_non_nullable
              as AdoptionRequest?,
      doctorRequest: freezed == doctorRequest
          ? _value.doctorRequest
          : doctorRequest // ignore: cast_nullable_to_non_nullable
              as DoctorRequest?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.notificationId,
      required this.userId,
      this.adoptionRequest,
      this.doctorRequest,
      this.seen = false,
      this.timestamp});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final String userId;
  @override
  final AdoptionRequest? adoptionRequest;
  @override
  final DoctorRequest? doctorRequest;
  @override
  @JsonKey()
  final bool seen;
  @override
  final dynamic timestamp;

  @override
  String toString() {
    return 'Notification(notificationId: $notificationId, userId: $userId, adoptionRequest: $adoptionRequest, doctorRequest: $doctorRequest, seen: $seen, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.adoptionRequest, adoptionRequest) ||
                other.adoptionRequest == adoptionRequest) &&
            (identical(other.doctorRequest, doctorRequest) ||
                other.doctorRequest == doctorRequest) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationId,
      userId,
      adoptionRequest,
      doctorRequest,
      seen,
      const DeepCollectionEquality().hash(timestamp));

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required final String notificationId,
      required final String userId,
      final AdoptionRequest? adoptionRequest,
      final DoctorRequest? doctorRequest,
      final bool seen,
      final dynamic timestamp}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  String get userId;
  @override
  AdoptionRequest? get adoptionRequest;
  @override
  DoctorRequest? get doctorRequest;
  @override
  bool get seen;
  @override
  dynamic get timestamp;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
