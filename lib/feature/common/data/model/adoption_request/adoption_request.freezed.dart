// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adoption_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdoptionRequest _$AdoptionRequestFromJson(Map<String, dynamic> json) {
  return _AdoptionRequest.fromJson(json);
}

/// @nodoc
mixin _$AdoptionRequest {
  String get adoptionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get dogId => throw _privateConstructorUsedError;
  String get requestUserEmail => throw _privateConstructorUsedError;
  String get ownerUserId => throw _privateConstructorUsedError;
  Decision get organizationDecision => throw _privateConstructorUsedError;

  /// Serializes this AdoptionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdoptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdoptionRequestCopyWith<AdoptionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdoptionRequestCopyWith<$Res> {
  factory $AdoptionRequestCopyWith(
          AdoptionRequest value, $Res Function(AdoptionRequest) then) =
      _$AdoptionRequestCopyWithImpl<$Res, AdoptionRequest>;
  @useResult
  $Res call(
      {String adoptionId,
      String userId,
      String dogId,
      String requestUserEmail,
      String ownerUserId,
      Decision organizationDecision});

  $DecisionCopyWith<$Res> get organizationDecision;
}

/// @nodoc
class _$AdoptionRequestCopyWithImpl<$Res, $Val extends AdoptionRequest>
    implements $AdoptionRequestCopyWith<$Res> {
  _$AdoptionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdoptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adoptionId = null,
    Object? userId = null,
    Object? dogId = null,
    Object? requestUserEmail = null,
    Object? ownerUserId = null,
    Object? organizationDecision = null,
  }) {
    return _then(_value.copyWith(
      adoptionId: null == adoptionId
          ? _value.adoptionId
          : adoptionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dogId: null == dogId
          ? _value.dogId
          : dogId // ignore: cast_nullable_to_non_nullable
              as String,
      requestUserEmail: null == requestUserEmail
          ? _value.requestUserEmail
          : requestUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationDecision: null == organizationDecision
          ? _value.organizationDecision
          : organizationDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
    ) as $Val);
  }

  /// Create a copy of AdoptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DecisionCopyWith<$Res> get organizationDecision {
    return $DecisionCopyWith<$Res>(_value.organizationDecision, (value) {
      return _then(_value.copyWith(organizationDecision: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdoptionRequestImplCopyWith<$Res>
    implements $AdoptionRequestCopyWith<$Res> {
  factory _$$AdoptionRequestImplCopyWith(_$AdoptionRequestImpl value,
          $Res Function(_$AdoptionRequestImpl) then) =
      __$$AdoptionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String adoptionId,
      String userId,
      String dogId,
      String requestUserEmail,
      String ownerUserId,
      Decision organizationDecision});

  @override
  $DecisionCopyWith<$Res> get organizationDecision;
}

/// @nodoc
class __$$AdoptionRequestImplCopyWithImpl<$Res>
    extends _$AdoptionRequestCopyWithImpl<$Res, _$AdoptionRequestImpl>
    implements _$$AdoptionRequestImplCopyWith<$Res> {
  __$$AdoptionRequestImplCopyWithImpl(
      _$AdoptionRequestImpl _value, $Res Function(_$AdoptionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdoptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adoptionId = null,
    Object? userId = null,
    Object? dogId = null,
    Object? requestUserEmail = null,
    Object? ownerUserId = null,
    Object? organizationDecision = null,
  }) {
    return _then(_$AdoptionRequestImpl(
      adoptionId: null == adoptionId
          ? _value.adoptionId
          : adoptionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dogId: null == dogId
          ? _value.dogId
          : dogId // ignore: cast_nullable_to_non_nullable
              as String,
      requestUserEmail: null == requestUserEmail
          ? _value.requestUserEmail
          : requestUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationDecision: null == organizationDecision
          ? _value.organizationDecision
          : organizationDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdoptionRequestImpl implements _AdoptionRequest {
  const _$AdoptionRequestImpl(
      {required this.adoptionId,
      required this.userId,
      required this.dogId,
      required this.requestUserEmail,
      required this.ownerUserId,
      required this.organizationDecision});

  factory _$AdoptionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdoptionRequestImplFromJson(json);

  @override
  final String adoptionId;
  @override
  final String userId;
  @override
  final String dogId;
  @override
  final String requestUserEmail;
  @override
  final String ownerUserId;
  @override
  final Decision organizationDecision;

  @override
  String toString() {
    return 'AdoptionRequest(adoptionId: $adoptionId, userId: $userId, dogId: $dogId, requestUserEmail: $requestUserEmail, ownerUserId: $ownerUserId, organizationDecision: $organizationDecision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdoptionRequestImpl &&
            (identical(other.adoptionId, adoptionId) ||
                other.adoptionId == adoptionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dogId, dogId) || other.dogId == dogId) &&
            (identical(other.requestUserEmail, requestUserEmail) ||
                other.requestUserEmail == requestUserEmail) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.organizationDecision, organizationDecision) ||
                other.organizationDecision == organizationDecision));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, adoptionId, userId, dogId,
      requestUserEmail, ownerUserId, organizationDecision);

  /// Create a copy of AdoptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdoptionRequestImplCopyWith<_$AdoptionRequestImpl> get copyWith =>
      __$$AdoptionRequestImplCopyWithImpl<_$AdoptionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdoptionRequestImplToJson(
      this,
    );
  }
}

abstract class _AdoptionRequest implements AdoptionRequest {
  const factory _AdoptionRequest(
      {required final String adoptionId,
      required final String userId,
      required final String dogId,
      required final String requestUserEmail,
      required final String ownerUserId,
      required final Decision organizationDecision}) = _$AdoptionRequestImpl;

  factory _AdoptionRequest.fromJson(Map<String, dynamic> json) =
      _$AdoptionRequestImpl.fromJson;

  @override
  String get adoptionId;
  @override
  String get userId;
  @override
  String get dogId;
  @override
  String get requestUserEmail;
  @override
  String get ownerUserId;
  @override
  Decision get organizationDecision;

  /// Create a copy of AdoptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdoptionRequestImplCopyWith<_$AdoptionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorRequest _$DoctorRequestFromJson(Map<String, dynamic> json) {
  return _DoctorRequest.fromJson(json);
}

/// @nodoc
mixin _$DoctorRequest {
  String get doctorRequestId => throw _privateConstructorUsedError;
  String get requestUserEmail => throw _privateConstructorUsedError;
  String get requestUserId => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  Decision get doctorDecision => throw _privateConstructorUsedError;

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
      {String doctorRequestId,
      String requestUserEmail,
      String requestUserId,
      String doctorId,
      Decision doctorDecision});

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
    Object? doctorRequestId = null,
    Object? requestUserEmail = null,
    Object? requestUserId = null,
    Object? doctorId = null,
    Object? doctorDecision = null,
  }) {
    return _then(_value.copyWith(
      doctorRequestId: null == doctorRequestId
          ? _value.doctorRequestId
          : doctorRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      requestUserEmail: null == requestUserEmail
          ? _value.requestUserEmail
          : requestUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      requestUserId: null == requestUserId
          ? _value.requestUserId
          : requestUserId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorDecision: null == doctorDecision
          ? _value.doctorDecision
          : doctorDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
    ) as $Val);
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
      {String doctorRequestId,
      String requestUserEmail,
      String requestUserId,
      String doctorId,
      Decision doctorDecision});

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
    Object? doctorRequestId = null,
    Object? requestUserEmail = null,
    Object? requestUserId = null,
    Object? doctorId = null,
    Object? doctorDecision = null,
  }) {
    return _then(_$DoctorRequestImpl(
      doctorRequestId: null == doctorRequestId
          ? _value.doctorRequestId
          : doctorRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      requestUserEmail: null == requestUserEmail
          ? _value.requestUserEmail
          : requestUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
      requestUserId: null == requestUserId
          ? _value.requestUserId
          : requestUserId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorDecision: null == doctorDecision
          ? _value.doctorDecision
          : doctorDecision // ignore: cast_nullable_to_non_nullable
              as Decision,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorRequestImpl implements _DoctorRequest {
  const _$DoctorRequestImpl(
      {required this.doctorRequestId,
      required this.requestUserEmail,
      required this.requestUserId,
      required this.doctorId,
      required this.doctorDecision});

  factory _$DoctorRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorRequestImplFromJson(json);

  @override
  final String doctorRequestId;
  @override
  final String requestUserEmail;
  @override
  final String requestUserId;
  @override
  final String doctorId;
  @override
  final Decision doctorDecision;

  @override
  String toString() {
    return 'DoctorRequest(doctorRequestId: $doctorRequestId, requestUserEmail: $requestUserEmail, requestUserId: $requestUserId, doctorId: $doctorId, doctorDecision: $doctorDecision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorRequestImpl &&
            (identical(other.doctorRequestId, doctorRequestId) ||
                other.doctorRequestId == doctorRequestId) &&
            (identical(other.requestUserEmail, requestUserEmail) ||
                other.requestUserEmail == requestUserEmail) &&
            (identical(other.requestUserId, requestUserId) ||
                other.requestUserId == requestUserId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorDecision, doctorDecision) ||
                other.doctorDecision == doctorDecision));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, doctorRequestId,
      requestUserEmail, requestUserId, doctorId, doctorDecision);

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
      {required final String doctorRequestId,
      required final String requestUserEmail,
      required final String requestUserId,
      required final String doctorId,
      required final Decision doctorDecision}) = _$DoctorRequestImpl;

  factory _DoctorRequest.fromJson(Map<String, dynamic> json) =
      _$DoctorRequestImpl.fromJson;

  @override
  String get doctorRequestId;
  @override
  String get requestUserEmail;
  @override
  String get requestUserId;
  @override
  String get doctorId;
  @override
  Decision get doctorDecision;

  /// Create a copy of DoctorRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorRequestImplCopyWith<_$DoctorRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Decision _$DecisionFromJson(Map<String, dynamic> json) {
  return _Decision.fromJson(json);
}

/// @nodoc
mixin _$Decision {
  String get status =>
      throw _privateConstructorUsedError; // Options: accepted, rejected
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this Decision to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DecisionCopyWith<Decision> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionCopyWith<$Res> {
  factory $DecisionCopyWith(Decision value, $Res Function(Decision) then) =
      _$DecisionCopyWithImpl<$Res, Decision>;
  @useResult
  $Res call({String status, String reason});
}

/// @nodoc
class _$DecisionCopyWithImpl<$Res, $Val extends Decision>
    implements $DecisionCopyWith<$Res> {
  _$DecisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecisionImplCopyWith<$Res>
    implements $DecisionCopyWith<$Res> {
  factory _$$DecisionImplCopyWith(
          _$DecisionImpl value, $Res Function(_$DecisionImpl) then) =
      __$$DecisionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String reason});
}

/// @nodoc
class __$$DecisionImplCopyWithImpl<$Res>
    extends _$DecisionCopyWithImpl<$Res, _$DecisionImpl>
    implements _$$DecisionImplCopyWith<$Res> {
  __$$DecisionImplCopyWithImpl(
      _$DecisionImpl _value, $Res Function(_$DecisionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? reason = null,
  }) {
    return _then(_$DecisionImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DecisionImpl implements _Decision {
  const _$DecisionImpl({required this.status, required this.reason});

  factory _$DecisionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DecisionImplFromJson(json);

  @override
  final String status;
// Options: accepted, rejected
  @override
  final String reason;

  @override
  String toString() {
    return 'Decision(status: $status, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecisionImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, reason);

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DecisionImplCopyWith<_$DecisionImpl> get copyWith =>
      __$$DecisionImplCopyWithImpl<_$DecisionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DecisionImplToJson(
      this,
    );
  }
}

abstract class _Decision implements Decision {
  const factory _Decision(
      {required final String status,
      required final String reason}) = _$DecisionImpl;

  factory _Decision.fromJson(Map<String, dynamic> json) =
      _$DecisionImpl.fromJson;

  @override
  String get status; // Options: accepted, rejected
  @override
  String get reason;

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DecisionImplCopyWith<_$DecisionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
