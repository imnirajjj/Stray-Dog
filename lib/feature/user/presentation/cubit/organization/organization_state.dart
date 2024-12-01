part of 'organization_cubit.dart';

@freezed
class OrganizationState with _$OrganizationState {
  const factory OrganizationState({
    @Default(false) bool loading,
  }) = _Initial;
}
