import 'package:front_end/core/network/error_message.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  final int stateCode;

  const ServerException({
    required this.errorMessageModel,
    required this.stateCode
  });
}


class AuthException implements Exception {
  final int? statusCode;
  final String? authMessage;
  AuthException({
    required this.statusCode,
    required this.authMessage,
  });

  @override
  String toString() => 'AuthException(statusCode: $statusCode, authMessage: $authMessage)';
}
