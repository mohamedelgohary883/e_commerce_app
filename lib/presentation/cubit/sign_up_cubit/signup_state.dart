part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final Map<String, dynamic> response;
  SignupSuccess(this.response);
}

final class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure(this.errorMessage);
}
