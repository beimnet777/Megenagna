import 'package:flutter_bloc/flutter_bloc.dart';
import './save_event.dart';
import './save_state.dart';

class ProfileUpdaterBloc extends Bloc<PressedEvent, SaveState> {
  ProfileUpdaterBloc() : super(Idle()) {
    on<PressedEvent>(_onSave);
  }

  void _onSave(PressedEvent event, Emitter emit) {
    emit(Saving());
    // print("something here");
    emit(Saved());
  }
}
