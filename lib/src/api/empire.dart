import 'dart:convert';

import 'package:common/src/api/api.dart';
import 'package:common/view.dart';

import 'package:jaguar_resty/jaguar_resty.dart' as resty;

abstract class PlayerApi implements Api {
  @override
  Future<Empire> getMyEmpire() async {
    final response = await resty.Get(baseUrl)
        .path('/api/1.0')
        .path('/empire')
        .header('X-Auth-Token', tokenStore.load())
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      onSessionExpire?.call();
      throw Exception('authorization failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if (response.statusCode != 200) {
      throw Exception('unexpected status code');
    }

    final map = jsonDecode(response.body);
    final ret = Empire.fromMap(map);

    return ret;
  }

  @override
  Future<Empire> firstCity() async {
    final response = await resty
        .post(baseUrl)
        .path('/api/1.0')
        .path('/empire/firstCity')
        .header('X-Auth-Token', tokenStore.load())
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      onSessionExpire?.call();
      throw Exception('authorization failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if (response.statusCode != 200) {
      throw Exception('unexpected status code');
    }

    final map = jsonDecode(response.body);
    final ret = Empire.fromMap(map);

    return ret;
  }

  @override
  Future<World> getWorld() async {
    final response = await resty.Get(baseUrl)
        .path('/api/1.0')
        .path('/world')
        .header('X-Auth-Token', tokenStore.load())
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      onSessionExpire?.call();
      throw Exception('authorization failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if (response.statusCode != 200) {
      throw Exception('unexpected status code');
    }

    final map = jsonDecode(response.body);
    final ret = World.fromMap(map);

    return ret;
  }
}
