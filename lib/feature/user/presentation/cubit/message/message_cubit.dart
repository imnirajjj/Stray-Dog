import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stray_dog_adoption/feature/common/data/model/message/message.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(const MessageState());
}
