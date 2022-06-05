import '../blocs/create_profile_blocs/createprofileevent.dart';
import '../data_provider/companyProfile.dart';

class ProfileRepository {
  final CompanyProfileProvider profileProvider;
  ProfileRepository(this.profileProvider);

  Future create(CreateProfilePressed profile,int id) async {
    return this.profileProvider.createEmployeeProfile(profile,id);
  }
}
