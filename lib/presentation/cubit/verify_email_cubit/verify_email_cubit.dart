import 'package:e_commerce_app/infrastructure/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo authRepo;
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(VerifyEmailLoading());
    try {
      await authRepo.verifyEmail(email: email, otp: otp);
      emit(VerifyEmailSuccess());
    } catch (e) {
      emit(VerifyEmailFailure(e.toString()));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoading());

    try {
      await authRepo.resendOtp(email: email);
      emit(ResendOtpSuccess());
    } catch (e) {
      emit(VerifyEmailFailure(e.toString()));
    }
  }
}
