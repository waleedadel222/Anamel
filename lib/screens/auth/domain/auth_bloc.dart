import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/auth_firebase_repository.dart';
import '../data/repository/user_repository.dart';
import '../model/user_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFirebaseRepository authFirebaseRepo;
  final UserRepository userRepo;

  AuthBloc({required this.authFirebaseRepo, required this.userRepo})
    : super(AuthInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await authFirebaseRepo.registerWithEmailAndPassword(event.email, event.password);

        if (user != null) {
          await userRepo.createUserDocument(
            UserModel(uid: user.uid, name: event.name, email: event.email),
          );
        }

        emit(AuthSuccess(user! as Map<String, dynamic>));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LoginUser>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await authFirebaseRepo.logInWithEmailAndPassword(
          event.email,
           event.password
        );

        emit(AuthSuccess(user! as Map<String, dynamic>));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
