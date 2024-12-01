part of 'message_cubit.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    @Default(false) bool loading,
    @Default([]) List<Message> message,
    UserDetail? self,
    UserDetail? other,
  }) = _Initial;
}
