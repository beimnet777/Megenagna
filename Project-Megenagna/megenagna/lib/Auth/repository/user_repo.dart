import 'dart:ffi';

import 'package:megenagna/Auth/data%20provider/user_provider.dart';
import 'package:megenagna/Auth/models/user.dart';

class UserRepository {
  final UserProvider userProvider;
  UserRepository(this.userProvider);

  Future<User> create(User user) async {
    return this.userProvider.createUser(user);
  }

   Future<User> get(User user) async {
    return this.userProvider.getUser("${user.id}");
  }

  Future<dynamic> update(User user) async {

    return this.userProvider.updateUser(user);
  }

  Future<dynamic> delete(User user) async {
    return this.userProvider.deleteUser(user);
  }
}
