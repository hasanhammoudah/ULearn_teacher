import 'package:bloc/bloc.dart';
import 'package:ulearn_teacher/pages/welcome/bloc/welcome_event.dart';
import 'package:ulearn_teacher/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
