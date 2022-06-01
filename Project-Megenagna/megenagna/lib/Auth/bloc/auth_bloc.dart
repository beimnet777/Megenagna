
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc(): super(Idle()){
    on<Login>(_onLogin);

  }

  void _onLogin(Login event, Emitter emit){
    emit(Logingin());
    print('logging in');

    emit(Loggedin());


  }

}