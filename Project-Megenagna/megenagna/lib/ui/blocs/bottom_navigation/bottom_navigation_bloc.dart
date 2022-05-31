import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megenagna/blocs/bottom_navigation/bottom_navigation_event.dart';

class BottomNavBloc extends Bloc<BarItemChanged, int> {
  BottomNavBloc(int initialState) : super(initialState) {
    on<BarItemChanged>(_change);
  }
}

void _change(BarItemChanged event, Emitter emit) {
  emit(event.index);
}
