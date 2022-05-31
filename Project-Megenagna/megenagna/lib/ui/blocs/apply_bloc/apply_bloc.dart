import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megenagna/blocs/apply_bloc/apply_event.dart';
import 'package:megenagna/blocs/apply_bloc/apply_state.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState> {
  ApplyBloc(ApplyState initialState) : super(initialState) {
    on<ApplyEvent>(_applyHandler);
  }
}

void _applyHandler(ApplyEvent event, Emitter emit) {
  emit(Saving());
  emit(ApplySuccesfull());
}
