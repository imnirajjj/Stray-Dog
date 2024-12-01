part of 'adopt_cubit.dart';

@freezed
class AdoptState with _$AdoptState {
  const factory AdoptState({
    @Default(false) bool loading,
  }) = _Initial;
}
