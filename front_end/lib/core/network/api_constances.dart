class ApiConstances {
  static const String _baseUrl = "https://dummyjson.com";
  static const String _baseImgUrl = 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/';

  static const String usersPath = "$_baseUrl/users";

  static String imageUrl(String number) => "$_baseImgUrl$number.jpg";

}
