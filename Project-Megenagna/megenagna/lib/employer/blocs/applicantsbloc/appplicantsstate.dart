import 'package:last/employer/blocs/applicantsbloc/applicantsbloc.dart';
import 'package:last/employer/models/application.dart';

abstract class ApplicantsState {}

class Idle extends ApplicantsState {}

class LoadingApplicants extends ApplicantsState {}

class LoadingFailed extends ApplicantsState {}

class LoadedApplicants extends ApplicantsState {
  final List<Application> applicants;
  final int id;
  LoadedApplicants(this.applicants, this.id);
}
