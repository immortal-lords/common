import 'dart:convert';

import 'package:common/src/api/api.dart';
import 'package:common/view.dart';

import 'package:jaguar_resty/jaguar_resty.dart' as resty;

abstract class AuthApi implements Api {
  @override
  Future<SignupResponse> signup(SignupRequest payload) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/auth/signup')
        .json(payload)
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if(response.statusCode != 200) {
      throw Exception('unexpected status code');
    }

    final map = jsonDecode(response.body);
    return SignupResponse.fromMap(map);
  }

  @override
  Future<LoginResponse> login(LoginRequest payload) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/auth/login')
        .json(payload)
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      throw Exception('authentication failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if(response.statusCode != 200) {
      throw Exception('unexpected status code');
    }

    final map = jsonDecode(response.body);
    final ret = LoginResponse.fromMap(map);

    tokenStore.store(ret.token);

    return ret;
  }
}
