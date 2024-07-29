class ApiConstances {
  static const String _baseUrl = "https://dummyjson.com";

  static const String signInPath = "$_baseUrl/auth/login";
  static const String signUpPath = "$_baseUrl/users/add";
  static const String getUserPath = "$_baseUrl/auth/me";
  static const String refershTokenPath = "$_baseUrl/auth/refresh";



  static String updatePash(int id) => "$_baseUrl/users/$id";

}
