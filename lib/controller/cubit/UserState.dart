class UserState{}
final class UserInitial extends UserState {}

final class UploadProfilePic extends UserState{}

//sign in
final class SignInLoading extends UserState{}
final class SignInFailure extends UserState{
  final String message;
  SignInFailure({required this.message});}
final class SignInSuccess extends UserState{
  final String message;

  SignInSuccess({required this.message});
}


//sign up
final class SignUpLoading extends UserState{}
final class SignUpFailure extends UserState {
  final String message;
  SignUpFailure({required this.message});


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

final class ShowUserLoading extends UserState{}
final class ShowUserSuccess extends UserState{}
final class ShowUserFailure extends UserState{}


final class UpdateProfileLoading extends UserState{}
final class UpdateProfileFailure extends UserState{}
final class UpdateProfileSuccess extends UserState{}


final class GetAllStoresLoading extends UserState{}
final class GetAllStoresFailure extends UserState{}
final class GetAllStoresSuccess extends UserState{
 List stores;

  GetAllStoresSuccess({required this.stores});
}


final class AddToFavoriteSuccess extends UserState{}



final class GetProductSuccess extends UserState{
   List products;
   String storeName;
   GetProductSuccess({required this.products,required this.storeName});

}
final class GetProductFailure extends UserState{}
final class GetProductLoading extends UserState{}

