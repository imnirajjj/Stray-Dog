part of 'doctor_request_cubit.dart';

@freezed
class DoctorRequestState with _$DoctorRequestState {
  const factory DoctorRequestState({
    @Default(false) bool loading,
  }) = _Initial;
}
