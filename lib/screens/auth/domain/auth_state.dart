import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Map<String, dynamic> userData;
  AuthSuccess(this.userData);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
