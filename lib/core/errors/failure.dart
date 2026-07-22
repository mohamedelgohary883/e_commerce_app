import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');

      default:
        return ServerFailure('Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    try {
      if (response is Map<String, dynamic>) {
        // لو السيرفر رجع Validation Errors
        if (response['errors'] is Map) {
          final errors = response['errors'] as Map;

          if (errors.isNotEmpty) {
            final firstError = errors.values.first;

            if (firstError is List && firstError.isNotEmpty) {
              return ServerFailure(firstError.first.toString());
            }

            return ServerFailure(firstError.toString());
          }
        }

        // لو رجع Message
        if (response['message'] != null) {
          return ServerFailure(response['message'].toString());
        }

        // لو رجع Error
        if (response['error'] != null) {
          final error = response['error'];

          if (error is Map && error['message'] != null) {
            return ServerFailure(error['message'].toString());
          }

          return ServerFailure(error.toString());
        }

        // لو رجع Title
        if (response['title'] != null) {
          return ServerFailure(response['title'].toString());
        }
      }

      switch (statusCode) {
        case 400:
          return ServerFailure('Bad Request');

        case 401:
          return ServerFailure('Unauthorized');

        case 403:
          return ServerFailure('Forbidden');

        case 404:
          return ServerFailure('Your request was not found.');

        case 500:
          return ServerFailure('Internal Server Error.');

        default:
          return ServerFailure('Oops! Something went wrong.');
      }
    } catch (_) {
      return ServerFailure('Oops! Something went wrong.');
    }
  }
}
