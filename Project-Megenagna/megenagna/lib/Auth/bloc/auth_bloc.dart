
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc(): super(Idle()){
    on<Login>(_onLogin);
    on<SignUp>(_onSignUp);
    on<Register>(_onRegister);

  }

  void _onLogin(Login event, Emitter emit){
    emit(Logingin());
    print('logging in');

    emit(Loggedin());


  }

  void _onSignUp(SignUp event, Emitter emit){
    
    emit(SigningUp());
  }

  void _onRegister(Register event, Emitter emit){
    
    emit(Logingin());
  }

}
