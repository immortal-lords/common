import 'dart:convert';

import 'package:common/common.dart';
import 'package:common/src/api/api.dart';
import 'package:common/view.dart';

import 'package:jaguar_resty/jaguar_resty.dart' as resty;

abstract class CityApi implements Api {
  @override
  Future<City> getMyCityById(int cityId, {City city}) async {
    final response = await resty.Get(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}')
        .header('X-Auth-Token', tokenStore.load())
        .query('version', city?.version)
        .go();
    if (response.statusCode == 400) {
      throw Exception('bad request'); // TODO
    } else if (response.statusCode == 403) {
      onSessionExpire?.call();
      throw Exception('authorization failed');
    } else if (response.statusCode == 500) {
      throw Exception('server error'); // TODO
    } else if (response.statusCode == 204) {
      if (city == null) {
        throw Exception('wrong response from server.');
      }
      return city;
    } else if (response.statusCode != 200) {
      throw Exception('unexpected status code');
    }

    final map = jsonDecode(response.body);
    final ret = City.fromMap(map);

    return ret;
  }

  @override
  Future<void> constructBuilding(
      int cityId, Position position, int type) async {
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
    } else if (response.statusCode != 204) {
      throw Exception('unexpected status code');
    }
  }

  @override
  Future<void> upgradeBuilding(int cityId, int buildingId, int level) async {
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
  Future<void> completeBuildingUpgrade(int cityId, int buildingId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/buildings/${buildingId}/upgrade/complete')
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
  Future<void> cancelBuildingUpgrade(int cityId, int buildingId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/buildings/${buildingId}/upgrade/cancel')
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
  Future<void> moveBuilding(
      int cityId, int buildingId, Position newPosition) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/buildings/${buildingId}/move')
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
  Future<void> demolishBuilding(int cityId, int buildingId) async {
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

  @override
  Future<void> recruit(int cityId, int type, int count) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/recruitments')
        .header('X-Auth-Token', tokenStore.load())
        .query('warriorType', type)
        .query('count', count)
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
  Future<void> completeRecruitment(int cityId, int recruitmentId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/recruitments/${recruitmentId}/complete')
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
  Future<void> cancelRecruitment(int cityId, int recruitmentId) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/recruitments/${recruitmentId}/cancel')
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
  Future<void> dismissFighters(int cityId, int type, int count) async {
    final response = await resty.Post(baseUrl)
        .path('/api/1.0')
        .path('/cities/${cityId}/fighters/${type}/dismiss')
        .header('X-Auth-Token', tokenStore.load())
        .query('count', count)
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
