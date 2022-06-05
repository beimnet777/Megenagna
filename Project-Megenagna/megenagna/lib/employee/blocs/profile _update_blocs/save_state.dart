import 'package:last/employee/models/employee.dart';

abstract class SaveState {}

class Idle extends SaveState {}

class Saving extends SaveState {}

class Saved extends SaveState {}

class Loading extends SaveState {}

class LoadFailed extends SaveState {}

class Loaded extends SaveState {
  final Employee employee;

  Loaded(this.employee);
}
