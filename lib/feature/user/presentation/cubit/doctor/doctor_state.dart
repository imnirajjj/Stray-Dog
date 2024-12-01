part of 'doctor_cubit.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState({
    @Default(false) bool loading,
  }) = _DoctorState;
}
