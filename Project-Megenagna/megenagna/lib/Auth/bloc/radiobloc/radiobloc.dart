import 'package:bloc/bloc.dart';
import 'package:last/Auth/bloc/radiobloc/radioevent.dart';

class RadioBloc extends Bloc<RadioEvent, int> {
  RadioBloc() : super(1) {
    on<RadioEvent>(_onchange);
  }

  void _onchange(RadioEvent event, Emitter emit) {
    if (event is RadioPressed) {
      if (event.num == 1) {
        emit(2);
      } else {
        emit(1);
      }
    }
  }
}
