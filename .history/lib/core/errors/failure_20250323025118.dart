import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServiceFailure extends Failure {
  ServiceFailure({required super.errorMessage});

  factory ServiceFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure(errorMessage: 'Connection Timed out');

      case DioExceptionType.sendTimeout:
        return ServiceFailure(errorMessage: 'Send Time out');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure(errorMessage: 'Receive Time out');
      case DioExceptionType.badCertificate:
        return ServiceFailure(errorMessage: 'oops there was an error');

      case DioExceptionType.badResponse:
        ServiceFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!,
        );
        throw UnimplementedError();
      case DioExceptionType.cancel:
        return ServiceFailure(errorMessage: 'Request cancelled');
      case DioExceptionType.connectionError:
        return ServiceFailure(errorMessage: 'Connection Error ');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServiceFailure(errorMessage: 'No internet Connection');
        }
        return ServiceFailure(
          errorMessage: 'Unexpected Error, please try again later',
        );
    }
  }

  factory ServiceFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 500) {
      return ServiceFailure(errorMessage: 'Internal server error');
    } else {
      return ServiceFailure(errorMessage: 'Oops there was an error');
    }
  }
}
