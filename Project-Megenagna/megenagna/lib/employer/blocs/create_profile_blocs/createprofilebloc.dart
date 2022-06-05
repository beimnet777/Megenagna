import 'package:bloc/bloc.dart';
import 'package:last/employer/blocs/create_profile_blocs/createprofileevent.dart';
import 'package:last/employer/blocs/create_profile_blocs/createprofilestate.dart';

import '../../data_provider/companyProfile.dart';
import '../../repository/profileRepo.dart';

final CompanyProfileProvider companyProvider = CompanyProfileProvider();
final ProfileRepository profileRepo = ProfileRepository(companyProvider);

class CreateProfileBloc extends Bloc<CreateProfileEvent, CreateProfileState> {
  CreateProfileBloc() : super(Idle()) {
    on<CreateProfileEvent>(_onSaving);
  }

  void _onSaving(CreateProfileEvent event, Emitter emit) async {
    emit(Saving());
    // if (event is CreateProfilePressed) {
    //   var response = await profileRepo.create(event, 7);
    // }
    emit(Saved());
  }
}
