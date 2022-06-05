import 'package:last/employee/models/applications.dart';

abstract class ApplicationEvent {}

class ApplyEvent extends ApplicationEvent {
  final Application application;
  ApplyEvent(this.application);
}

class LoadEvents extends ApplicationEvent {
  final int id;

  LoadEvents(this.id);
}
