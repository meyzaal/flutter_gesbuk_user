import 'package:flutter_gesbuk_user/data/providers/network/api_endpoint.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_provider.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';

class AuthAPI implements APIRequestRepresentable {
  String? token;

  AuthAPI._({this.token});

  AuthAPI.signIn(String? token) : this._(token: token);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.user;

  @override
  Map<String, String>? get headers => {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  @override
  HTTPMethod get method => HTTPMethod.post;

  @override
  String get path => '/google-validate';

  @override
  Map<String, String>? get query => null;

  @override
  Future request() => APIProvider.instance.request(this);

  @override
  String get url => endpoint + path;
}
