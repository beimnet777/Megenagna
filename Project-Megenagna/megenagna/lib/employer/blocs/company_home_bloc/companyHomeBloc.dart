import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeEvent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'companyHomeState.dart';
import 'companyHomeEvent.dart';
import 'package:last/employer/data_provider/Job_provider.dart';
import 'package:last/employer/repository/job_repo.dart';

final JobProvider jobProvider = JobProvider();
final JobRepository jobRepo = JobRepository(jobProvider);

class CompanyHomeBloc extends Bloc<LoadingEvent, PageState> {
  CompanyHomeBloc() : super(Loading()) {
    on<LoadingEvent>(_onLoad);
  }

  void _onLoad(LoadingEvent event, Emitter emit) async {
    print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    emit(Loading());
    print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    final prefs = await SharedPreferences.getInstance();
    print("***********");
    int? id = await prefs.getInt('id');
    print(id);
    var jobs = await jobRepo.getAllJobs(id!); // id is provided to the bloc
    if (jobs == 0) {
      emit(LoadingFailed());
    } else {
      emit(Loaded(jobs));
    }
  }

  static JobProvider() {}

  static JobRepository(jobProvider) {}
}
