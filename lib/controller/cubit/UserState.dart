class UserState{}
final class UserInitial extends UserState {}


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