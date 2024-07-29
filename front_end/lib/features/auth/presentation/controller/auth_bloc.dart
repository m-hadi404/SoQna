import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/auth/domain/usecase/sing_in.dart';
import 'package:front_end/features/auth/domain/usecase/get_user.dart';
import 'package:front_end/features/auth/domain/usecase/sing_up.dart';
import 'package:front_end/features/auth/domain/usecase/update_user.dart';

import '../../domain/entities/user.dart';

part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserUseCase getUserUseCase;
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final UpdateUserUseCase updateUserUseCase;

  AuthBloc(this.getUserUseCase, this.signInUseCase, this.signUpUseCase,
      this.updateUserUseCase)
      : super(const AuthState()) {
    on<GetUserEvent>(_getUserHandler);
    on<SignInEvent>(_singInHandler);
    on<SignUpEvent>(_singUpHandler);
    on<UpdateUserEvent>(_updateUserHandler);
  }

  FutureOr<void> _getUserHandler(
      GetUserEvent event, Emitter<AuthState> emit) async {
    final result = await getUserUseCase(const NoParameters());
    // print(result);
    // emit(const AuthState(getUsersState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            getUserMessage: l.message, getUserState: RequestState.error)),
        (r) =>
            emit(state.copyWith(user: r, getUserState: RequestState.loaded)));
  }

  FutureOr<void> _singInHandler(
      SignInEvent event, Emitter<AuthState> emit) async {
    final result = await signInUseCase(
        SignInParameters(username: event.username, password: event.password));
    result.fold(
        (l) => emit(state.copyWith(
            signInMessage: l.message, signInState: RequestState.error)),
        (r) => emit(state.copyWith(
            user: r, signInState: RequestState.loaded))); //createUser: r,
  }

  FutureOr<void> _singUpHandler(
      SignUpEvent event, Emitter<AuthState> emit) async {
    final result = await signUpUseCase(SignUpParameters(
        username: event.username,
        password: event.password,
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName));
    result.fold(
        (l) => emit(state.copyWith(
            signUpMessage: l.message, signUpState: RequestState.error)),
        (r) => emit(state.copyWith(
            user: r, signUpState: RequestState.loaded))); //createUser: r,
  }

  FutureOr<void> _updateUserHandler(
      UpdateUserEvent event, Emitter<AuthState> emit) async {
    final result = await updateUserUseCase(UpdateUserParameters(
        id: event.id,
        username: event.username,
        password: event.password,
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName,
        ));
    result.fold(
        (l) => emit(state.copyWith(
            updateUserMessage: l.message, updateUserState: RequestState.error)),
        (r) => emit(state.copyWith(
            user: r, updateUserState: RequestState.loaded))); //createUser: r,
  }
}
