class ApiConstans {
  static const String baseUrl = 'https://anamel.runasp.net/api';

  // authantication call apis
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String forgetPassword = '$baseUrl/forgot-password';
  static const String logout = '$baseUrl/logout';
  static const String resetPassword = '$baseUrl/reset-password';
  static const String verifyEmail = '$baseUrl/verify-email';
  static const String refreshToken = '$baseUrl/Auth/refresh';

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
  static const String getCategoryById = '$baseUrl/Categories/:id';
  static const String deletCategory = "$baseUrl/harddelete/66";
  static const String addCategory = "$baseUrl/Categories";
  static const String updateCategory = '$baseUrl/Categories/:id';
  //product call apis
  static const String getProductById = '$baseUrl/Categories/:id';
  static const String updateProductInCategory = '$baseUrl/Categories/:id';
  static const String deleteCategory = '$baseUrl/Categories/:id';
  static const String getPrductsByCategoryId = '$baseUrl/Products/category/:id';
  static const String deleteProduct = "$baseUrl/Products/:id";
}
