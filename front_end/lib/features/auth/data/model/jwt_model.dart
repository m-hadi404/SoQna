import 'dart:convert';

import 'package:equatable/equatable.dart';

class JwtModel extends Equatable {
  final String token;
  final String refreshToken;

  const JwtModel({
    required this.token,
    required this.refreshToken,
  });

  JwtModel copyWith({
    String? token,
    String? refreshToken,
  }) {
    return JwtModel(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  factory JwtModel.fromJson(Map<String, dynamic> map) {
    return JwtModel(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  factory JwtModel.fromStr(String str) {
    Map json = jsonDecode(str);
    return JwtModel(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  String toJson() => jsonEncode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token, refreshToken];
}
