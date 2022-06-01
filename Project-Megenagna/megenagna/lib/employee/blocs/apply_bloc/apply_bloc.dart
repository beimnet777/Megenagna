import 'package:flutter_bloc/flutter_bloc.dart';
import 'apply_event.dart';
import 'apply_state.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState> {
  ApplyBloc() : super(Idle()) {
    on<ApplyEvent>(_applyHandler);
  }
}

void _applyHandler(ApplyEvent event, Emitter emit) {
  emit(Saving());
  emit(ApplySuccesfull());
}
