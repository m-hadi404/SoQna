import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message, required this.stateCode});

  final String message;
  final int stateCode;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.stateCode, required super.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.stateCode, required super.message});
}
