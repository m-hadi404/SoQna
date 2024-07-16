import 'package:front_end/core/network/error_message.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  final int stateCode;

  const ServerException({
    required this.errorMessageModel,
    required this.stateCode
  });
}
