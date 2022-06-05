import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/Auth/data%20provider/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../repository/user_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

final UserProvider userProvider = UserProvider();
final UserRepository userRepo = UserRepository(userProvider);

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
    on<SignUp>(_onSignUp);
    on<Register>(_onRegister);
  }

  void _onLogin(Login event, Emitter emit) async {
    emit(Logingin());

    var response = await userRepo.login(event);
    if (response == 0) {
      emit(LoginFailed());
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response["access"]);

      var response2 = await userRepo.getUserInfo();
      print(response2);
      print(response2[0]['fields']['id']);
      await prefs.setInt('id', response2[0]['pk']);
      var type = response2[0]['fields']['groups'];
      print("**************************************");
      print(type);
      await prefs.setInt('type', type[0]);

      emit(Loggedin());
    }
  }

  void _onSignUp(SignUp event, Emitter emit) {
    emit(SigningUp());
  }

  void _onRegister(Register event, Emitter emit) async {
    print(event.firstName);
    var response = await userRepo.create(event);
    if (response == 0) {
      var logeer = Login(username: response.username, password: event.password);
      var response2 = await userRepo.login(logeer);

      final prefs = await SharedPreferences.getInstance();

      await prefs.setInt('id', response.id);
      print("******************************");
      print(response2);
      await prefs.setString('token', response2["access"]);
      final String? action = prefs.getString('token');
      print(action);

      emit(ToProfile());
    } else {
      emit(SigningUpFailed());
    }
  }
}
