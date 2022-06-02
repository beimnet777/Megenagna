import 'package:megenagna/Auth/data%20provider/user_provider.dart';
import 'package:megenagna/Auth/models/user.dart';

class UserRepository {
  final UserProvider userProvider;
  UserRepository(this.userProvider);

  Future<User> create(User user) async {
    return this.userProvider.createUser(user);
  }
}
