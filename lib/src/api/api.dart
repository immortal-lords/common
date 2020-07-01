import 'package:common/common.dart';
import 'package:common/src/api/auth.dart';
import 'package:common/src/api/city.dart';
import 'package:common/src/api/player.dart';
import 'package:common/src/model/auth.dart';
import 'package:common/src/model/city.dart';
import 'package:common/src/model/model.dart';

import 'package:jaguar_resty/jaguar_resty.dart' as resty;

abstract class Api {
  factory Api({String baseUrl}) = _ApiImpl;

  String get baseUrl;

  String authToken;

  Future<SignupResponse> signup(SignupRequest payload);

  Future<LoginResponse> login(LoginRequest payload);

  Future<Empire> getMyEmpire();

  Future<Empire> firstCity();

  Future<City> getMyCityById(int cityId);

  Future<Building> construct(int cityId, Position position, int type);

  Future<void> upgrade(int cityId, int buildingId, int level);

  Future<void> demolish(int cityId, int buildingId);
}

class _ApiImpl with AuthApi, CityApi, PlayerApi implements Api {
  @override
  final String baseUrl;

  String authToken;

  _ApiImpl({this.baseUrl: ''});
}