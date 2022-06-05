import 'package:last/employee/models/Employer.dart';
import 'package:last/employee/models/jobs.dart';

abstract class JobState {}

class Idle extends JobState {}

class LoadingJobs extends JobState {}

class LoadingFailed extends JobState {}

class LoadedJobs extends JobState {
  final List<Job> jobs;
  final List<Employer> emps;
  LoadedJobs(this.jobs, this.emps);
}
