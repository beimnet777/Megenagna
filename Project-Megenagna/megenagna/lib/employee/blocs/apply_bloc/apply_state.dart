import 'package:last/employee/models/Employer.dart';
import 'package:last/employee/models/applications.dart';
import 'package:last/employee/models/jobs.dart';

abstract class ApplyState {}

class Idle extends ApplyState {}

class Saving extends ApplyState {}

class ApplySuccesfull extends ApplyState {}

class ApplyFailed extends ApplyState {}

class LoadingApplication extends ApplyState {}

class LoadingFailed extends ApplyState {}

class LoadedApplication extends ApplyState {
  List<Application> apps;
  List<Job> jobs;
  List<Employer> emps;
  LoadedApplication({
    required this.apps,
    required this.jobs,
    required this.emps,
  });
}
