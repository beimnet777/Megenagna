
import 'package:last/Auth/data%20provider/user_provider.dart';

import '../models/user.dart';

import '../bloc/auth_bloc.dart';

class UserRepository {
  final UserProvider userProvider;
  UserRepository(this.userProvider);

  Future create(Register register) async {
    final int id = 0;
    final String username = register.username;
    final String password = register.password;
    final String first_name = register.firstName;
    final String last_name = register.lastName;
    final String email = register.email;
    int type = register.type;
    User user = User(1, first_name, last_name, email, username, password, type);

    return this.userProvider.createUser(user);
  }

  Future<User> get(User user) async {
    return this.userProvider.getUser("");
  }

  Future<dynamic> update(User user) async {
    return this.userProvider.updateUser(user);
  }

  Future<dynamic> delete(User user) async {
    return this.userProvider.deleteUser(user);
  }

  Future login(Login login) async {
    return this.userProvider.loging(login);
  }

  Future getUserInfo() async {
    return this.userProvider.getUserInfo();
  }
}


// class UserDataRepository {
//   final UserDataProvider userDataProvider;
//   UserDataRepository(this.userDataProvider);

//   Future create(Register register) async {
//     final String username = register.username;
//     final String password = register.password;
//     int type;
//     UserData userdata = UserData(username, password);

//     return this.userDataProvider.createUserData(userdata);
//   }

//   Future<User> get(User user) async {
//     return this.userDataProvider.getUserData("");
//   }

//   Future<dynamic> update(User user) async {
//     return this.userProvider.updateUser(user);
//   }

//   Future<dynamic> delete(User user) async {
//     return this.userProvider.deleteUser(user);
//   }
// }
