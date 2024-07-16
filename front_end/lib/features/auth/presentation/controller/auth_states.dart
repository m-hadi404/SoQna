import 'package:equatable/equatable.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';

class AuthState extends Equatable {

  final RequestState createUserState;
  final String createUserMessage;

  final List<User> getUsers;
  final RequestState getUsersState;
  final String getUsersMessage;

  const AuthState(
      {
      this.createUserState = RequestState.loading,
      this.createUserMessage = '',
      this.getUsers = const [],
      this.getUsersState = RequestState.loading,
      this.getUsersMessage = '',
      });

  AuthState copyWith({
    RequestState? createUserState,
    String? createUserMessage,
    List<User>? getUsers,
    RequestState? getUsersState,
    String? getUsersMessage,
  }) {
    return AuthState(
      createUserState: createUserState ?? this.createUserState,
      createUserMessage: createUserMessage ?? this.createUserMessage,
      getUsers: getUsers ?? this.getUsers,
      getUsersState: getUsersState ?? this.getUsersState,
      getUsersMessage: getUsersMessage ?? this.getUsersMessage,
    );
  }

  @override
  List<Object?> get props => [
        createUserState,
        createUserMessage,
        getUsers,
        getUsersState,
        getUsersMessage,
      ];
}
