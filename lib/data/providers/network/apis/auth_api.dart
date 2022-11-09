import 'package:flutter_gesbuk_user/data/providers/network/api_endpoint.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_provider.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';

enum AuthType { signIn, getUser }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;

  AuthAPI._({required this.type});

  AuthAPI.signIn() : this._(type: AuthType.signIn);
  AuthAPI.getUserInfo() : this._(type: AuthType.getUser);

  @override
  get body => null;

  @override
  String get endpoint {
    switch (type) {
      case AuthType.signIn:
        return APIEndpoint.auth;

      case AuthType.getUser:
        return APIEndpoint.user;
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthType.signIn:
        return HTTPMethod.post;

      case AuthType.getUser:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case AuthType.signIn:
        return '/google-validate';

      case AuthType.getUser:
        return '';
    }
  }

  @override
  Map<String, String>? get query => null;

  @override
  Future request() => APIProvider.instance.request(this);

  @override
  String get url => endpoint + path;

  @override
  bool get requiresAuthToken => true;
}
