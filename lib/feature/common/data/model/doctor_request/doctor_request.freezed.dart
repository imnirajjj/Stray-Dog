// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorRequest _$DoctorRequestFromJson(Map<String, dynamic> json) {
  return _DoctorRequest.fromJson(json);
}

/// @nodoc
mixin _$DoctorRequest {
  String get userId => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // Options: pending, accepted, rejected
  String get reason => throw _privateConstructorUsedError;
  Decision get adminDecision =>
      throw _privateConstructorUsedError; // Nested AdminDecision object
  Decision get doctorDecision =>
      throw _privateConstructorUsedError; // Nested DoctorDecision object
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this DoctorRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorRequestCopyWith<DoctorRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorRequestCopyWith<$Res> {
  factory $DoctorRequestCopyWith(
          DoctorRequest value, $Res Function(DoctorRequest) then) =
      _$DoctorRequestCopyWithImpl<$Res, DoctorRequest>;
  @useResult
  $Res call(
      {String userId,
      String doctorId,
      String status,
      String reason,
      Decision adminDecision,
      Decision doctorDecision,
      DateTime timestamp});

  $DecisionCopyWith<$Res> get adminDecision;
  $DecisionCopyWith<$Res> get doctorDecision;
}

/// @nodoc
class _$DoctorRequestCopyWithImpl<$Res, $Val extends DoctorRequest>
    implements $DoctorRequestCopyWith<$Res> {
  _$DoctorRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? doctorId = null,
    Object? status = null,
    Object? reason = null,
    Object? adminDecision = null,
    Object? doctorDecision = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      adminDecision: null == adminDecision
          ? _value.adminDecision
          : adminDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
      doctorDecision: null == doctorDecision
          ? _value.doctorDecision
          : doctorDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DecisionCopyWith<$Res> get adminDecision {
    return $DecisionCopyWith<$Res>(_value.adminDecision, (value) {
      return _then(_value.copyWith(adminDecision: value) as $Val);
    });
  }

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DecisionCopyWith<$Res> get doctorDecision {
    return $DecisionCopyWith<$Res>(_value.doctorDecision, (value) {
      return _then(_value.copyWith(doctorDecision: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorRequestImplCopyWith<$Res>
    implements $DoctorRequestCopyWith<$Res> {
  factory _$$DoctorRequestImplCopyWith(
          _$DoctorRequestImpl value, $Res Function(_$DoctorRequestImpl) then) =
      __$$DoctorRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String doctorId,
      String status,
      String reason,
      Decision adminDecision,
      Decision doctorDecision,
      DateTime timestamp});

  @override
  $DecisionCopyWith<$Res> get adminDecision;
  @override
  $DecisionCopyWith<$Res> get doctorDecision;
}

/// @nodoc
class __$$DoctorRequestImplCopyWithImpl<$Res>
    extends _$DoctorRequestCopyWithImpl<$Res, _$DoctorRequestImpl>
    implements _$$DoctorRequestImplCopyWith<$Res> {
  __$$DoctorRequestImplCopyWithImpl(
      _$DoctorRequestImpl _value, $Res Function(_$DoctorRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? doctorId = null,
    Object? status = null,
    Object? reason = null,
    Object? adminDecision = null,
    Object? doctorDecision = null,
    Object? timestamp = null,
  }) {
    return _then(_$DoctorRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      adminDecision: null == adminDecision
          ? _value.adminDecision
          : adminDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
      doctorDecision: null == doctorDecision
          ? _value.doctorDecision
          : doctorDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorRequestImpl implements _DoctorRequest {
  const _$DoctorRequestImpl(
      {required this.userId,
      required this.doctorId,
      required this.status,
      required this.reason,
      required this.adminDecision,
      required this.doctorDecision,
      required this.timestamp});

  factory _$DoctorRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorRequestImplFromJson(json);

  @override
  final String userId;
  @override
  final String doctorId;
  @override
  final String status;
// Options: pending, accepted, rejected
  @override
  final String reason;
  @override
  final Decision adminDecision;
// Nested AdminDecision object
  @override
  final Decision doctorDecision;
// Nested DoctorDecision object
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'DoctorRequest(userId: $userId, doctorId: $doctorId, status: $status, reason: $reason, adminDecision: $adminDecision, doctorDecision: $doctorDecision, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.adminDecision, adminDecision) ||
                other.adminDecision == adminDecision) &&
            (identical(other.doctorDecision, doctorDecision) ||
                other.doctorDecision == doctorDecision) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, doctorId, status, reason,
      adminDecision, doctorDecision, timestamp);

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorRequestImplCopyWith<_$DoctorRequestImpl> get copyWith =>
      __$$DoctorRequestImplCopyWithImpl<_$DoctorRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorRequestImplToJson(
      this,
    );
  }
}

abstract class _DoctorRequest implements DoctorRequest {
  const factory _DoctorRequest(
      {required final String userId,
      required final String doctorId,
      required final String status,
      required final String reason,
      required final Decision adminDecision,
      required final Decision doctorDecision,
      required final DateTime timestamp}) = _$DoctorRequestImpl;

  factory _DoctorRequest.fromJson(Map<String, dynamic> json) =
      _$DoctorRequestImpl.fromJson;

  @override
  String get userId;
  @override
  String get doctorId;
  @override
  String get status; // Options: pending, accepted, rejected
  @override
  String get reason;
  @override
  Decision get adminDecision; // Nested AdminDecision object
  @override
  Decision get doctorDecision; // Nested DoctorDecision object
  @override
  DateTime get timestamp;

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorRequestImplCopyWith<_$DoctorRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
