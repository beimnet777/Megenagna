part of 'auth_bloc.dart';

abstract class AuthEvent {}

class Login extends AuthEvent {
  Login({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}

class SignUp extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  SignUp(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
