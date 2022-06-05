import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employee/data%20provider/ApplicationProvider.dart';
import 'package:last/employee/data%20provider/EmployerProvider.dart';
import 'package:last/employee/data%20provider/job_provider.dart';
import 'package:last/employee/repository/app_repository.dart';
import 'package:last/employee/repository/job_local_repository.dart';
import 'apply_event.dart';
import 'apply_state.dart';

final ApplicationProvider applicationProvider = ApplicationProvider();
final EmployerProvider empProv = EmployerProvider();
final ApplicationRepository applicationRepository = ApplicationRepository(
    applicationProvider,
    empProv,
    JobRepository(jobProvider: JobProvider(), employerProvider: empProv));

class ApplyBloc extends Bloc<ApplicationEvent, ApplyState> {
  ApplyBloc(t) : super(Idle()) {
    on<ApplyEvent>(_applyHandler);
    on<LoadEvents>(_loadHandler);
  }
}

void _applyHandler(ApplyEvent event, Emitter emit) async {
  print("in bloc func");
  emit(Saving());

  final apps = await applicationRepository.getApplicationByApplier(
      event.application.job, event.application.user);
  if (apps == null) {
  final apps = await applicationProvider.createApplication(event.application);
  }
  emit(ApplySuccesfull());
}

void _loadHandler(LoadEvents event, Emitter emit) async {
  emit(LoadingApplication());
  print("in loader");
  final everything = await applicationRepository.getApplicationById(event.id);
  print("got id");
  emit(LoadedApplication(
      apps: everything[0], jobs: everything[1], emps: everything[2]));
}
