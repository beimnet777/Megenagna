import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/application.dart';
import 'applicantsevent.dart';
import 'appplicantsstate.dart';
import 'applicantsevent.dart';
import 'package:last/employer/screens/Applicants.dart';
import 'package:last/employer/data_provider/Job_provider.dart';
import 'package:last/employer/repository/job_repo.dart';

final JobProvider jobProvider = JobProvider();
final JobRepository jobRepo = JobRepository(jobProvider);

class ApplicantsBloc extends Bloc<ApplicantsEvent, ApplicantsState> {
  ApplicantsBloc() : super(Idle()) {
    on<ApplicantsEvent>(_load);
  }

  void _load(ApplicantsEvent event, Emitter emit) async {
    emit(LoadingApplicants());
    int id = 0;
    if (event is LoadApplicants) {
      id = event.id;
    }
    print("-============================-");
    print(id);
    print("-============================-");
    var apps = await jobRepo.getAllApplicants(id);
    if (apps == 0) {
      emit(LoadingFailed());
    } else {
      print(apps);
      emit(LoadedApplicants(apps, id));
    }
  }
}
