class UserState{}
final class UserInitial extends UserState {}

final class UploadProfilePic extends UserState{}

//sign in
final class SignInLoading extends UserState{}
final class SignInFailure extends UserState{
  final String message;
  final String errors;
  SignInFailure( {required this.message,required this.errors,});}
final class SignInSuccess extends UserState{
  final String message;

  SignInSuccess({required this.message});
}


//sign up
final class SignUpLoading extends UserState{}
final class SignUpFailure extends UserState {
  final String message;
  final String errors;

  SignUpFailure({required this.message, required this.errors});
}


final class SignUpSuccess extends UserState{
  final String message;
  SignUpSuccess({required this.message});
}

final class LogOutLoading extends UserState{}
final class LogOutFailure extends UserState{
  final String message;
  LogOutFailure( {required this.message,});
}
final class LogOutSuccess extends UserState{
  final String message;
  LogOutSuccess({required this.message});
}

final class ShowUserBuIdLoading extends UserState{}
final class ShowUserByIdSuccess extends UserState{

  final String first_name;
  final String last_name;
  final String location;
  final String image;
  final int phone_number;


  ShowUserByIdSuccess({required this.first_name, required this.last_name, required this.location, required this.image, required this.phone_number});}
final class ShowUserByIdFailure extends UserState{}

final class ShowUserFailure extends UserState{}
final class ShowUserSuccess extends UserState{}
final class ShowUserLoading extends UserState{}


final class UpdateProfileLoading extends UserState{}
final class UpdateProfileFailure extends UserState{}
final class UpdateProfileSuccess extends UserState{}


final class GetAllStoresLoading extends UserState{}
final class GetAllStoresFailure extends UserState{}
final class GetAllStoresSuccess extends UserState{
 List stores;

  GetAllStoresSuccess({required this.stores});
}


final class AddToFavoriteSuccess extends UserState{
  final String message;
  final int id;

  AddToFavoriteSuccess({required this.message, required this.id});
}
final class AddToFavoriteFailure extends UserState{}
final class DeleteFromFavoriteSuccess extends UserState{}

final class AllFavoriteLoading extends UserState{}
final class AllFavoriteSuccess extends UserState{
  final List favorites;

  AllFavoriteSuccess({required this.favorites});
}
final class AllFavoriteFailure extends UserState{
  final String message;

  AllFavoriteFailure({required this.message});
}



final class GetProductSuccess extends UserState{
   List products;
   String storeName;
   GetProductSuccess({required this.products,required this.storeName});

}
final class GetProductFailure extends UserState{}
final class GetProductLoading extends UserState{}
final class GetProductByIdSuccess extends UserState {
  final int id;
  final String name;
  final int available_quantity;
  final String description;
  final String price;
  final List<String> image_urls;
  final Map<String, String> colors_array;
  final Map<String, String> sizesArray;

  GetProductByIdSuccess(this.name, this.description, this.price, this.image_urls, this.colors_array, this.sizesArray, this.id, this.available_quantity,);}

final class GetProductByIdFailure extends UserState{}
final class GetProductByIdLoading extends UserState{}

final class ResetPasswordSuccess extends UserState{
  final String message;

  ResetPasswordSuccess({required this.message});
}
final class ResetPasswordFailure extends UserState{
  final String message;
  ResetPasswordFailure({required this.message});
}
final class ResetPasswordLoading extends UserState{}


final class SendCodeSuccess extends UserState{
  final String message;

  SendCodeSuccess({required this.message});

}
final class SendCodeFailure extends UserState{
  final String message;
  final String errors;


  SendCodeFailure({required this.message,required this.errors});}
final class SendCodeLoading extends UserState{}

final class VerifyCodeLoading extends UserState{}
final class VerifyCodeSuccess extends UserState{}
final class VerifyCodeFailure extends UserState{
  final String message;
  final String errors;

  VerifyCodeFailure({required this.message,required this.errors});
}


final class ShowCartLoading extends UserState{}
final class ShowCartFailure extends UserState{
  final String message;

  ShowCartFailure({required this.message});
}
final class ShowCartSuccess extends UserState{
  final List cart;
  var total_delivery_charge;
  var final_total ;
  var total_items;
  var total_price;

  ShowCartSuccess( {required this.cart, required this.total_delivery_charge,
    required this.final_total, required this.total_items,required this.total_price,});
}

final class SearchStoreLoading extends UserState{}
final class SearchStoreSuccess extends UserState{
  final List searchStores;

  SearchStoreSuccess({required this.searchStores});
}

final class SearchProductLoading extends UserState{}
final class SearchProductSuccess extends UserState{
  final List searchProducts;

  SearchProductSuccess({required this.searchProducts});
}
final class ChangePasswordLoading extends UserState{}
final class ChangePasswordSuccess extends UserState{
  final String message;
  ChangePasswordSuccess({required this.message});
}
final class ChangePasswordFailure extends UserState{
  final String message;
  final String errors;

  ChangePasswordFailure( {required this.message,required this.errors});
}


final class OrderLoading extends UserState{}
final class OrderFailure extends UserState{}
final class OrderSuccess extends UserState{

 final List products;
 final List orders;

  OrderSuccess({required this.products, required this.orders});
}
final class ConfirmSuccess extends UserState{}

//sign in delivery
final class DeliverySignInLoading extends UserState{}
final class DeliverySignInFailure extends UserState{
  final String error;
  DeliverySignInFailure( {required this.error,});}
final class DeliverySignInSuccess extends UserState{
  final String message;

  DeliverySignInSuccess({required this.message});
}


//sign up delivery
final class DeliverySignUpLoading extends UserState{}
final class DeliverySignUpFailure extends UserState {
  final String message;
  final String errors;

  DeliverySignUpFailure({ required this.errors,required this.message,});
}
final class DeliverySignUpSuccess extends UserState{
  final String message;
  DeliverySignUpSuccess({required this.message});
}

final class DeliveryLogOutLoading extends UserState{}
final class DeliveryLogOutFailure extends UserState{
  final String message;
  DeliveryLogOutFailure( {required this.message,});
}
final class DeliveryLogOutSuccess extends UserState{
  final String message;
  DeliveryLogOutSuccess({required this.message});
}
