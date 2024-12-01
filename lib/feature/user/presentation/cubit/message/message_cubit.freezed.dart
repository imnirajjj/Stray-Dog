// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageState {
  bool get loading => throw _privateConstructorUsedError;
  List<Message> get message => throw _privateConstructorUsedError;
  UserDetail? get self => throw _privateConstructorUsedError;
  UserDetail? get other => throw _privateConstructorUsedError;

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res, MessageState>;
  @useResult
  $Res call(
      {bool loading,
      List<Message> message,
      UserDetail? self,
      UserDetail? other});

  $UserDetailCopyWith<$Res>? get self;
  $UserDetailCopyWith<$Res>? get other;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? message = null,
    Object? self = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
    ) as $Val);
  }

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailCopyWith<$Res>? get self {
    if (_value.self == null) {
      return null;
    }

    return $UserDetailCopyWith<$Res>(_value.self!, (value) {
      return _then(_value.copyWith(self: value) as $Val);
    });
  }

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $UserDetailCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<Message> message,
      UserDetail? self,
      UserDetail? other});

  @override
  $UserDetailCopyWith<$Res>? get self;
  @override
  $UserDetailCopyWith<$Res>? get other;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? message = null,
    Object? self = freezed,
    Object? other = freezed,
  }) {
    return _then(_$InitialImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as UserDetail?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.loading = false,
      final List<Message> message = const [],
      this.self,
      this.other})
      : _message = message;

  @override
  @JsonKey()
  final bool loading;
  final List<Message> _message;
  @override
  @JsonKey()
  List<Message> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  final UserDetail? self;
  @override
  final UserDetail? other;

  @override
  String toString() {
    return 'MessageState(loading: $loading, message: $message, self: $self, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._message, _message) &&
            (identical(other.self, self) || other.self == self) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_message), self, other);

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements MessageState {
  const factory _Initial(
      {final bool loading,
      final List<Message> message,
      final UserDetail? self,
      final UserDetail? other}) = _$InitialImpl;

  @override
  bool get loading;
  @override
  List<Message> get message;
  @override
  UserDetail? get self;
  @override
  UserDetail? get other;

  /// Create a copy of MessageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
