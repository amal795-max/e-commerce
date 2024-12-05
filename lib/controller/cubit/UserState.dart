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
final class SignUpFailure extends UserState{
  final String message;
  final String error;
  SignUpFailure({required this.message, required this.error});
}
final class SignUpSuccess extends UserState{
  final String message;
  SignUpSuccess({required this.message});
}

final class LogOutLoading extends UserState{}
final class LogOutFailure extends UserState{
  final String message;
  final String errors;
  LogOutFailure( {required this.message,required this.errors});
}
final class LogOutSuccess extends UserState{
  final String message;
  LogOutSuccess({required this.message});
}