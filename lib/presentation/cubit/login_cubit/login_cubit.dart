import 'package:e_commerce_app/infrastructure/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await authRepo.login(email: email, password: password);
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
