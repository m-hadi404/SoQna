part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User user;
  final RequestState getUserState;
  final String getUserMessage;

  final RequestState signInState;
  final String signInMessage;

  final RequestState signUpState;
  final String signUpMessage;

  final RequestState updateUserState;
  final String updateUserMessage;

  const AuthState({
    this.user = const User(
        id: 0,
        username: '',
        email: '',
        firstName: '',
        lastName: '',
        age: 0,
        image: ''),
    this.getUserState = RequestState.loading,
    this.getUserMessage = '',
    this.signInState = RequestState.loading,
    this.signInMessage = '',
    this.signUpState = RequestState.loading,
    this.signUpMessage = '',
    this.updateUserState = RequestState.loading,
    this.updateUserMessage = '',
  });

  AuthState copyWith({
    User? user,
    RequestState? getUserState,
    String? getUserMessage,
    User? signIn,
    RequestState? signInState,
    String? signInMessage,
    User? singUp,
    RequestState? signUpState,
    String? signUpMessage,
    User? updateUser,
    RequestState? updateUserState,
    String? updateUserMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      getUserState: getUserState ?? this.getUserState,
      getUserMessage: getUserMessage ?? this.getUserMessage,
      signInState: signInState ?? this.signInState,
      signInMessage: signInMessage ?? this.signInMessage,
      signUpState: signUpState ?? this.signUpState,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      updateUserState: updateUserState ?? this.updateUserState,
      updateUserMessage: updateUserMessage ?? this.updateUserMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      user,
      getUserState,
      getUserMessage,
      signInState,
      signInMessage,
      signUpState,
      signUpMessage,
      updateUserState,
      updateUserMessage,
    ];
  }
}
