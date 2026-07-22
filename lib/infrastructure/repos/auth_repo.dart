import 'package:e_commerce_app/infrastructure/datasources/auth_data_source.dart';

class AuthRepo {
  final AuthDataSource remoteDataSource;
  AuthRepo(this.remoteDataSource);

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) {
    return remoteDataSource.login(email: email, password: password);
  }

  Future<Map<String, dynamic>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return remoteDataSource.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }

  Future<void> verifyEmail({required String email, required String otp}) {
    return remoteDataSource.verifyEmail(email: email, otp: otp);
  }

  Future<Map<String, dynamic>> resendOtp({required String email}) {
    return remoteDataSource.resendOtp(email: email);
  }
}
