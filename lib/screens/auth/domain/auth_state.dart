import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class AuthLogOut extends AuthState {}
