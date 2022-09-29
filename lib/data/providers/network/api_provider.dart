import 'dart:async';
import 'dart:io';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';
import 'package:get/get.dart';

class APIProvider {
  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request) async {
    try {
      final client = GetConnect(timeout: const Duration(seconds: 24));

      final response = await client
          .request(
            request.url,
            request.method.string,
            headers: request.headers,
            query: request.query,
            body: request.body,
          )
          .timeout(const Duration(seconds: 24));
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(response.bodyString);
      case 401:
        throw UnauthorizedException(response.bodyString);
      case 403:
        throw ForbiddenException(response.bodyString);
      case 404:
        throw BadRequestException(response.bodyString);
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final String? code;
  final String? message;
  final String? details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String? details)
      : super(
          code: "unauthorized",
          message: "Unauthorized",
          details: details,
        );
}

class ForbiddenException extends AppException {
  ForbiddenException(String? details)
      : super(
          code: "Forbidden",
          message: "forbidden",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
