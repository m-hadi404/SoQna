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

  final bool isAuthorized;
  final RequestState isAuthorizedState;
  final String isAuthorizedMessage;

  final RequestState logoutState;
  final String logoutMessage;

  const AuthState({
    this.user = const User(
        id: 0,
        username: '',
        email: '',
        firstName: '',
        lastName: '',
        image: ''),
    this.getUserState = RequestState.loading,
    this.getUserMessage = '',
    this.signInState = RequestState.loading,
    this.signInMessage = '',
    this.signUpState = RequestState.loading,
    this.signUpMessage = '',
    this.updateUserState = RequestState.loading,
    this.updateUserMessage = '',
    this.isAuthorized = false,
    this.isAuthorizedState = RequestState.loading,
    this.isAuthorizedMessage = '',
    this.logoutState = RequestState.loading,
    this.logoutMessage = '',
  });


  AuthState copyWith({
    User? user,
    RequestState? getUserState,
    String? getUserMessage,
    RequestState? signInState,
    String? signInMessage,
    RequestState? signUpState,
    String? signUpMessage,
    RequestState? updateUserState,
    String? updateUserMessage,
    bool? isAuthorized,
    RequestState? isAuthorizedState,
    String? isAuthorizedMessage,
    RequestState? logoutState,
    String? logoutMessage,
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
      isAuthorized: isAuthorized ?? this.isAuthorized,
      isAuthorizedState: isAuthorizedState ?? this.isAuthorizedState,
      isAuthorizedMessage: isAuthorizedMessage ?? this.isAuthorizedMessage,
      logoutState: logoutState ?? this.logoutState,
      logoutMessage: logoutMessage ?? this.logoutMessage,
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
      isAuthorized,
      isAuthorizedState,
      isAuthorizedMessage,
      logoutState,
      logoutMessage,
    ];
  }
}
