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

  @override
  List<Object?> get props => [name, email, password];
}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  LoginUser(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogoutUser extends AuthEvent {}

class LoadUserProfile extends AuthEvent {
  final String uid;

  LoadUserProfile(this.uid);

  @override
  List<Object?> get props => [uid];
}

class UpdateUserProfile extends AuthEvent {
  final String uid;
  final Map<String, dynamic> updatedData;

  UpdateUserProfile(this.uid, this.updatedData);

  @override
  List<Object?> get props => [uid, updatedData];
}

class DeleteUserAccount extends AuthEvent {
  final String uid;

  DeleteUserAccount(this.uid);

  @override
  List<Object?> get props => [uid];
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  ForgotPasswordEvent(this.email);

  @override
  List<Object?> get props => [email];
}

// Social Authentication Events
class SocialLogin extends AuthEvent {
  final String provider; // e.g., 'google', 'facebook'

  SocialLogin(this.provider);

  @override
  List<Object?> get props => [provider];
}

class SocialLogout extends AuthEvent {
  final String provider; // e.g., 'google', 'facebook'

  SocialLogout(this.provider);

  @override
  List<Object?> get props => [provider];
}
