abstract class ApplicantsEvent {}

class LoadApplicants extends ApplicantsEvent {
  final int id;
  LoadApplicants(this.id);
}
