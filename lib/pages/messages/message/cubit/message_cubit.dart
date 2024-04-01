import 'package:bloc/bloc.dart';
import 'package:ulearn_teacher/common/entities/message.dart';
import 'package:ulearn_teacher/pages/messages/message/cubit/message_state.dart';


class MessageCubit extends Cubit<MessageStates> {
  MessageCubit() : super(const MessageStates());

  void loadStatusChanged(bool loadStatus) {
    emit(state.copyWith(loadStatus: loadStatus));
  }

  void messageChanged(List<Message> message) {
    emit(state.copyWith(message: message));
  }
}
