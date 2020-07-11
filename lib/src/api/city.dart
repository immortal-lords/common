import 'dart:convert';

import 'package:common/common.dart';
import 'package:common/src/api/api.dart';
import 'package:common/view.dart';

import 'package:jaguar_resty/jaguar_resty.dart' as resty;

abstract class CityApi implements Api {
  @override
  Future<City> getMyCityById(int cityId) async {
    final response = await resty.Get(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}')
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
    final ret = City.fromMap(map);

    return ret;
  }

  @override
  Future<Building> construct(int cityId, Position position, int type) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/buildings/construct')
        .header('X-Auth-Token', tokenStore.load())
        .query('position', position.toJson())
        .query('buildingType', type.toString())
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
    final ret = Building.fromMap(map);

    return ret;
  }

  @override
  Future<void> upgrade(int cityId, int buildingId, int level) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/buildings/${buildingId}/upgrade')
        .header('X-Auth-Token', tokenStore.load())
        .query('buildingLevel', level.toString())
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      onSessionExpire?.call();
      throw Exception('authorization failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if (response.statusCode != 204) {
      throw Exception('unexpected status code');
    }
  }

  @override
  Future<void> demolish(int cityId, int buildingId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/buildings/${buildingId}/demolish')
        .header('X-Auth-Token', tokenStore.load())
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      onSessionExpire?.call();
      throw Exception('authorization failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if (response.statusCode != 204) {
      throw Exception('unexpected status code');
    }
  }
}
