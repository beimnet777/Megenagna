import 'package:last/employer/models/job.dart';

abstract class PageState{}
 
class Loading extends PageState{}

class LoadingFailed extends PageState {}

class Loaded extends PageState{
  List<Job> jobs;
  Loaded(this.jobs);
}