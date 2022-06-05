import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employer/blocs/post_blocs/postState.dart';
import 'package:last/employer/blocs/post_blocs/post_event.dart';
import 'package:last/employer/data_provider/Job_provider.dart';
import 'package:last/employer/repository/job_repo.dart';

final JobProvider jobProvider = JobProvider();
final JobRepository jobRepo = JobRepository(jobProvider);

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(Idle()) {
    on<PostEvent>(_onsave);
  }

  void _onsave(PostEvent event, Emitter emit) async {
    PostPressed newEvent = event as PostPressed;
    emit(Posting());
    var response = await jobRepo.create(newEvent);
    if (response == 0) {
      emit(PosteFailed());
    } else {
      print(response);
      emit(Posted());
    }
  }
}
