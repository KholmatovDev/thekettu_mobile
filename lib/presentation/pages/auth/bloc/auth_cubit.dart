import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thekettu/domain/repository/auth_repository.dart';
import 'package:thekettu/domain/usecase/auth/login_usecase.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  final LoginUseCase loginUseCase;

  AuthCubit({required this.authRepository, required this.loginUseCase}) : super(const AuthState.initial());

  Future<bool> checkToken() async {
    return await authRepository.checkToken();
  }

  Future<void> login({String? token,  VoidCallback? success}) async {
    await loginUseCase(token: token);
    success!();
  }
}
