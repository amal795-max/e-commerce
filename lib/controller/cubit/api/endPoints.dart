class EndPoint{
  static String baseUrl="http://192.168.1.112:8000/api/";
  static String login="login";
  static String logout="logout";
  static String register="register";
  static String profile="profile";
  static String favorites="favorites";
  static String update="profile/update";
  static String stores="admin/stores";
  static String product(storeId) {
    return "admin/stores/$storeId";
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
  static String product_id="product_id";
  static String id="id";
  static String selectedStoreId="selectedStoreId";
  static String selectedProductId="selectedProductId";



}