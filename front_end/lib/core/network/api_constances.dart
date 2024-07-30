class ApiConstances {
  static const String _baseUrl = "https://dummyjson.com";
  static const String _baseImgUrl = 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/';

  static const String usersPath = "$_baseUrl/users";


  static const String cartsPath = "$_baseUrl/carts";
  static const String addCartsPath = "$cartsPath/add";
  static String deleteUpdateCartPath(int id) => "$cartsPath/$id";
  static String cartsUserPath(int userId) => "$usersPath/$userId/carts";
  static String imageUrl(String number) => "$_baseImgUrl$number.jpg";

}
