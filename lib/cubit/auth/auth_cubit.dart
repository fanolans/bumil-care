import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_quiz/data/datasources/firebase_auth_datasource.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthDatasource _authDatasource;
  AuthCubit(
    this._authDatasource,
  ) : super(const AuthState.initial());

  void signInWithGoogle() async {
    emit(const AuthState.loading());
    try {
      await _authDatasource.signInWithGoogle();
      emit(const AuthState.success());
    } catch (e) {
      emit(const AuthState.error());
    }
  }

  void signOut() async {
    await _authDatasource.signOut();
    emit(const AuthState.initial());
  }
}
