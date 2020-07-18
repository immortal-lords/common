import 'dart:convert';

import 'package:common/common.dart';
import 'package:common/src/api/api.dart';
import 'package:common/view.dart';

import 'package:jaguar_resty/jaguar_resty.dart' as resty;

abstract class TowerApi implements Api {
  @override
  Future<void> constructTower(int cityId, Position position, int type) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/towers/construct')
        .header('X-Auth-Token', tokenStore.load())
        .query('position', position.toJson())
        .query('towerType', type.toString())
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
  Future<void> upgradeTower(int cityId, int towerId, int level) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/towers/${towerId}/upgrade')
        .header('X-Auth-Token', tokenStore.load())
        .query('towerLevel', level.toString())
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
  Future<void> completeTowerUpgrade(int cityId, int towerId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/towers/${towerId}/upgrade/complete')
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

  @override
  Future<void> cancelTowerUpgrade(int cityId, int towerId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/towers/${towerId}/upgrade/cancel')
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

  @override
  Future<void> moveTower(int cityId, int towerId, Position newPosition) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/towers/${towerId}/move')
        .header('X-Auth-Token', tokenStore.load())
        .query('position', newPosition.toString())
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
  Future<void> demolishTower(int cityId, int towerId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/towers/${towerId}/demolish')
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
