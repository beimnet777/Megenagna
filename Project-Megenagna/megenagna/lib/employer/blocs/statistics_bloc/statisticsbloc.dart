import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeEvent.dart';
import '../../data_provider/Job_provider.dart';
import '../../repository/job_repo.dart';
import 'statisticsstate.dart';
import 'statisticsevent.dart';

final JobProvider jobProvider = JobProvider();
final JobRepository jobRepo = JobRepository(jobProvider);

class StatBloc extends Bloc<StatLoading, StatState> {
  StatBloc() : super(Idle()) {
    on<StatLoading>(_onloading);
  }

  void _onloading(StatLoading event, Emitter emit) async {
    emit(Loading());
    int? id;
    if (event is LoadEvent) {
      id = event.id;
    }
    var data = await jobRepo.getJobStats(id!);
    if (data == 0) {
      emit(LoadingFailed());
    } else {
      emit(Loaded(data));
    }
  }
}
