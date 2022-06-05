import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:last/employee/models/employee.dart';
import 'package:last/employee/repository/employee_local_repository.dart';
import './save_event.dart';
import './save_state.dart';

class ProfileUpdaterBloc extends Bloc<PressedEvent, SaveState> {
  final EmployeeRepository employeeRepository;

  ProfileUpdaterBloc(this.employeeRepository) : super(Idle()) {
    on<Save>(_onSave);
    on<Load>(_onLoad);
  }

  void _onSave(Save event, Emitter emit) async {
    emit(Saving());
    try {
      try {
        this.employeeRepository.get(event.employee.id);
        await this.employeeRepository.update((event.employee));
      } catch (Exception) {
        print(event.employee.id);
        await this.employeeRepository.create(event.employee);
      }
      emit(Saved());
    } catch (Exceptions) {
      emit(SavingFailed());
    }
  }

  void _onLoad(Load event, Emitter emit) async {
    emit(Loading());
    try {
      Employee emp =
          await this.employeeRepository.getByUserId(event.id) as Employee;
      emit(Loaded(emp));
    } catch (Exceptions) {
      emit(LoadFailed());
    }
  }
}
