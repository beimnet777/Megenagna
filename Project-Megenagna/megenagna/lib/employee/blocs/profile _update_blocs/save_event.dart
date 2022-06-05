import 'package:last/employee/models/employee.dart';

abstract class PressedEvent {}

class Save extends PressedEvent {
  Employee employee;

  Save({
    required this.employee,
  });
}

class Load extends PressedEvent {
  int id;
  Load({
    required this.id,
  });
}
