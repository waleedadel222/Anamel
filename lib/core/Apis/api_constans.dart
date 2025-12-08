class ApiConstans {
  static const String baseUrl = 'https://anamel.runasp.net/api';
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc0YzAyMmQxLWIwNGUtNGNlZS05MDMyLWVmZmNmODZiMzkwNyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJhZG1pbkBlY29tbWVyY2UuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiYWRtaW5AZWNvbW1lcmNlLmNvbSIsIkZpcnN0TmFtZSI6IlN5c3RlbSIsIkxhc3ROYW1lIjoiQWRtaW5pc3RyYXRvciIsImp0aSI6ImIzZGY3ZmM3LTQ2N2UtNDVjMC1iNmI0LWFlODY0OTNiMzA5OSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwiZXhwIjoxNzY1ODExODM5LCJpc3MiOiJodHRwczovL2FuYW1lbC5ydW5hc3AubmV0IiwiYXVkIjoiaHR0cHM6Ly9hbmFtZWwucnVuYXNwLm5ldCJ9.losZ0qbhLsjW5ignhBzs7LiG1NeawdneXzt5GXQFBdU";

  // authentication call apis
  static const String login = '$baseUrl/Auth/login';
  static const String register = '$baseUrl/Auth/register';
  static const String forgetPassword = '$baseUrl/Auth/forgot-password';
  static const String logout = '$baseUrl/Auth/logout';
  static const String resetPassword = '$baseUrl/reset-password';
  static const String verifyEmail = '$baseUrl/verify-email';
  static const String refreshToken = '$baseUrl/Auth/refresh';
  static const String resendVerifyCode = '$baseUrl/Auth/resend-verification';

  // admin  call apis
  static const String getUser = '$baseUrl/Admin/users';
  static const String getUserbyId = '$baseUrl/Admin/users/:id';
  static const String deleteUser = '$baseUrl/Admin/users/:id';
  static const String addBulkProducts = '$baseUrl/Admin/products/bulk';
  static const String updateProduct = "$baseUrl/Admin/products/:id";
  // cart call apis
  static const String getCart = '$baseUrl/Cart';
  static const String deletCart = "$baseUrl/Cart";
  static const String addCart = "$baseUrl/Cart/items";
  static const String deletProductInCart = '$baseUrl/Cart/items/:id';


  //category call apis
  static const String getCategories = '$baseUrl/Categories';
  static const String getCategoryById = '$baseUrl/Categories';
  static const String deletCategory = "$baseUrl/harddelete/66";
  static const String addCategory = "$baseUrl/Categories";
  static const String updateCategory = '$baseUrl/Categories/:id';
  //product call apis
  static const String getProductById = '$baseUrl/Categories/:id';
  static const String updateProductInCategory = '$baseUrl/Categories/:id';
  static const String deleteCategory = '$baseUrl/Categories/:id';
  static const String getPrductsByCategoryId = '$baseUrl/Products/category';
  static const String deleteProduct = "$baseUrl/Products/:id";
  static const String getProducts = '$baseUrl/Products';
}
