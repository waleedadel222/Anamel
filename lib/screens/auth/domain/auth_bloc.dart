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
        final user = await authFirebaseRepo.registerWithEmailAndPassword(
          event.email,
          event.password,
        );

        if (user == null) {
          emit(AuthFailure("can't register user, try again later"));
          return;
        }

        final userModel = UserModel(
          uid: user.uid,
          name: event.name,
          email: event.email,
        );

        await userRepo.createUserDocument(userModel);

        emit(AuthSuccess(userModel));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LoginUser>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await authFirebaseRepo.logInWithEmailAndPassword(
          event.email,
          event.password,
        );

        if (user == null) {
          emit(AuthFailure("can't login user, try again later"));
          return;
        }

        final userModelData = await userRepo.getUser(user.uid);
        if (userModelData == null) {
          emit(AuthFailure('User data not found in database.'));
          return;
        }

        emit(AuthSuccess(userModelData));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    onLoadProfile(event, emit) async {
      emit(AuthLoading());

      try {
        final userModel = await userRepo.getUser(event.uid);
        if (userModel == null) {
          emit(AuthFailure("User not found"));
          return;
        }
        emit(AuthSuccess(userModel));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    }

    onLogout(event, emit) async {
      await authFirebaseRepo.logout();

      emit(AuthLogOut());
    }

  }
}
