import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employee/blocs/job_bloc/job_event.dart';
import 'package:last/employee/blocs/job_bloc/job_state.dart';
import 'package:last/employee/data%20provider/EmployerProvider.dart';
import 'package:last/employee/data%20provider/job_provider.dart';
import 'package:last/employee/models/Employer.dart';
import 'package:last/employee/repository/job_local_repository.dart';

final JobRepository jobRepository = JobRepository(
    jobProvider: JobProvider(), employerProvider: EmployerProvider());
List<Employer> empList = [];

class JobBloc extends Bloc<LoadJoabs, JobState> {
  JobBloc() : super(Idle()) {
    on<LoadJoabs>(_LoadHandler);
  }
}

void _LoadHandler(LoadJoabs event, Emitter emit) async {
  emit(LoadingJobs());
  try {
    List everything = await jobRepository.get();
    emit(LoadedJobs(everything[0], everything[1]));
  } catch (Exceptions) {
    emit(LoadingFailed());
  }
}
