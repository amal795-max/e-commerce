class EndPoint{
  static String baseUrl="http://192.168.1.103:8000/api/";
  static String login="login";
  static String logout="logout";
  static String register="register";
  static String profile="profile";
  static String sendCode="send-code";
  static String verify="verify-code";
  static String resetPassword="reset-password";
  static String cart="cart";
  static String confirmOrder="cart/confirm";
  static String favorites="favorites";
  static String update="profile/update";
  static String stores="admin/stores";
  static String searchStore="store/search";
  static String searchProduct="product/search";
  static String confirm="cart/confirm";
  static String order="order";
  static String changePassword="change-password";

  //driver
  static String loginDelivery="drivers/login";
  static String orders="drivers/orders";
  static String registerDelivery="drivers/register";
  static String logoutDriver="drivers/logout";
  static String orderState(id){
   return "drivers/orders/$id/status";}

static String deleteOrder(id){
   return "api/order/$id";}

static String showUserById(id){
  return "profile/$id";
}
  static String product(storeId) {
    return "admin/stores/$storeId";
  }
  static String productById(productId) {
    return "products/$productId";
  }
  static String deleteFromFavorite(productId) {
    return "favorites/$productId";
  }

  static String deleteProduct(productId) {
    return "cart/$productId";
  }

}
class ApiKeys{
  static String message="message";
  static String user="user";
  static String errors="errors";
  static String first_name="first_name";
  static String last_name="last_name";
  static String phone_number="phone_number";
  static String password="password";
  static String password_confirmation="password_confirmation";
  static String location="location";
  static String image="image";
  static String token="token";
  static String email="email";
  static String image_url="image_url";
  static String name="name";
  static String store_image="store_image";
  static String created_at="created_at";
  static String updated_at="updated_at";
  static String description="description";
  static String id="id";
  static String selectedStoreId="selectedStoreId";
  static String selectedProductColor="selectedProductColor";
  static String selectedProductSize="selectedProductSize";
  static String product_id="product_id";
  static String quantity="quantity";
  static String color="color";
  static String size="size";
  static String type="type";
  static String code="code";
  static String query="query";
  static String store_id="store_id";
  static String phone="phone";
  static String error="error";
  static String fcmToken="fcm-token";
  static String isFirstTime="isFirstTime";
  static String isLogin="isLogin";
  static String latitude="latitude";
  static String longitude="longitude";



}