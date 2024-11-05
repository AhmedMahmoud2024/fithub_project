import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/sign_in-user.dart';
import '../../domain/entities/user_entity.dart';

// Define UserState
class UserState {
  final bool isLoading;
  final String? error;
  final User? user;
  final UserEntity? userEntity;

  UserState({this.isLoading = false, this.error, this.user,this.userEntity});
}

// UserCubit
class UserCubit extends Cubit<UserState> {
  final RegisterUser registerUser;
  final SignInUser signInUser;

  UserCubit({required this.registerUser, required this.signInUser}) : super(UserState());

  Future<void> register(String email, String password, UserEntity userEntity) async {
    emit(UserState(isLoading: true));
    try {
      final user = await registerUser(email, password, userEntity);
      emit(UserState(user: user));
    } catch (e) {
      emit(UserState(error: e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(UserState(isLoading: true));
    try {
      final user = await signInUser(email, password);
      emit(UserState(user: user));
    } catch (e) {
      emit(UserState(error: e.toString()));
    }
  }
}