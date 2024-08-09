import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int? statusCode;
  final String statusMessage;

  const ErrorMessageModel(
      {this.statusCode, required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json["status_code"]?? 401, statusMessage: json["message"]);
  }

  @override
  List<Object?> get props => [statusMessage];
}
