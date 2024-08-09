import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/model/jwt_model.dart';

class ApiConstances {
  static const String _baseUrl = "https://dummyjson.com";

  static const String signInPath = "$_baseUrl/auth/login";
  static const String signUpPath = "$_baseUrl/users/add";
  static const String getUserPath = "$_baseUrl/auth/me";
  static const String refershTokenPath = "$_baseUrl/auth/refresh";

  static Map<String, dynamic> headers(String token) {
    if (token != "") {
      return {"accept": "application/json", "Authorization": "Bearer $token"};
    } else {
      return {"accept": "application/json"};
    }
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');
    if (jwt != null) {
      return JwtModel.fromStr(jwt).token;
    }
    return "";
  }

  static String updatePash(int id) => "$_baseUrl/users/$id";
}
