import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        } else {
          return ServiceFailure(
            errorMessage: 'Unexpected Error, please try again later',
          );
        }
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
  factory ServiceFailure.fromFireBaseError(FirebaseAuthException ex) {
    if (ex.code == 'wrong-password') {
      return ServiceFailure(errorMessage: 'Wrong password, please try again.');
    } else if (ex.code == 'user-not-found') {
      return ServiceFailure(
        errorMessage:
            'User not found. Please register or enter the correct user.',
      );
    } else if (ex.code == 'email-already-in-use') {
      return ServiceFailure(
        errorMessage: 'This email is already in use. Try logging in instead.',
      );
    } else if (ex.code == 'invalid-email') {
      return ServiceFailure(
        errorMessage: 'Invalid email format. Please enter a valid email.',
      );
    } else if (ex.code == 'weak-password') {
      return ServiceFailure(
        errorMessage: 'Weak password. Please choose a stronger password.',
      );
    } else if (ex.code == 'too-many-requests') {
      return ServiceFailure(
        errorMessage: 'Too many failed attempts. Try again later.',
      );
    } else if (ex.code == 'network-request-failed') {
      return ServiceFailure(
        errorMessage: 'Network error. Check your connection and try again.',
      );
    } else if (ex.code == 'user-disabled') {
      return ServiceFailure(
        errorMessage: 'This account has been disabled by the administrator.',
      );
    } else if (ex.code == 'operation-not-allowed') {
      return ServiceFailure(
        errorMessage: 'This operation is not allowed. Contact support.',
      );
    } else if (ex.code == 'invalid-credential') {
      return ServiceFailure(
        errorMessage:
            'Invalid credentials. Please check your details and try again.',
      );
    } else {
      return ServiceFailure(
        errorMessage: 'An unknown error occurred. Please try again later.',
      );
    }
  }
}
