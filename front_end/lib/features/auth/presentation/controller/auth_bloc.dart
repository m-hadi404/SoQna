import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/auth/domain/usecase/create_user.dart';
import 'package:front_end/features/auth/domain/usecase/get_users.dart';
import 'package:front_end/features/auth/presentation/controller/auth_events.dart';
import 'package:front_end/features/auth/presentation/controller/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserUseCase createUserUseCase;
  final GetUsersUseCase getUsersUseCase;

  AuthBloc(this.createUserUseCase, this.getUsersUseCase)
      : super(const AuthState()) {
    on<CreateUserEvent>(_createUserHandler);
    on<GetUsersEvent>(_getUsersHandler);
  }

  FutureOr<void> _createUserHandler(
      CreateUserEvent event, Emitter<AuthState> emit) async {
    final result = await createUserUseCase(CreateUserParameters(
        name: event.name,
        email: event.email,
        password: event.password,
        phone: event.phone,
        avatar: event.avatar,
        createdAt: event.createdAt));
    result.fold(
        (l) => emit(state.copyWith(
            createUserMessage: l.message, createUserState: RequestState.error)),
        (_) => emit(state.copyWith(
            createUserState: RequestState.loaded))); //createUser: r,
  }

  FutureOr<void> _getUsersHandler(
      GetUsersEvent event, Emitter<AuthState> emit) async {
    final result = await getUsersUseCase(const NoParameters());
    // print(result);
    // emit(const AuthState(getUsersState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            getUsersMessage: l.message, getUsersState: RequestState.error)),
        (r) => emit(
            state.copyWith(getUsers: r, getUsersState: RequestState.loaded)));
  }
}
