import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUser extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterUser(this.name, this.email, this.password);
}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  LoginUser(this.email, this.password);
}

class LogoutUser extends AuthEvent {}

class LoadUserProfile extends AuthEvent {
  final String uid;
  LoadUserProfile(this.uid);
}
