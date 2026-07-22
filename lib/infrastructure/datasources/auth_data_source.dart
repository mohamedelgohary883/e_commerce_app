import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/api_service.dart';

abstract class AuthDataSource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<void> verifyEmail({required String email, required String otp});
  Future<Map<String, dynamic>> resendOtp({required String email});
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService apiService;
  AuthDataSourceImpl(this.apiService);

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final body = {"email": email, "password": password};

      print("Login Request: $body");

      final response = await apiService.post("/auth/login", data: body);

      print("Login Success: ${response.data}");

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print("Status: ${e.response?.statusCode}");
      print("Response: ${e.response?.data}");
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final body = {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
      };

      final response = await apiService.post('/auth/register', data: body);

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print("Status Code: ${e.response?.statusCode}");
      print("Response Data: ${e.response?.data}");
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail({required String email, required String otp}) async {
    await apiService.post(
      '/auth/verify-email',
      data: {'email': email, 'otp': otp},
    );
  }

  @override
  Future<Map<String, dynamic>> resendOtp({required String email}) async {
    final response = await apiService.post(
      '/auth/resend-otp',
      data: {'email': email},
    );

    return response.data as Map<String, dynamic>;
  }
}
