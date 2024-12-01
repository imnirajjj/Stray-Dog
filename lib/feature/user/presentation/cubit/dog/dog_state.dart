part of 'dog_cubit.dart';

@freezed
class DogState with _$DogState {
  const factory DogState({
    @Default(false) bool loading,
  }) = _Initial;
}
