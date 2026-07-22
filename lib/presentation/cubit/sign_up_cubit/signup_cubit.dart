import 'package:e_commerce_app/infrastructure/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    try {
      final response = await authRepo.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      emit(SignupSuccess(response));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
