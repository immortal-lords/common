import 'package:common/common.dart';
import 'package:common/src/api/auth.dart';
import 'package:common/src/api/city.dart';
import 'package:common/src/api/empire.dart';
import 'package:common/src/api/tower.dart';
import 'package:common/view.dart';

abstract class Api {
  factory Api(
      {String baseUrl,
      TokenStore tokenStore,
      Function onSessionExpire}) = _ApiImpl;

  String get baseUrl;

  TokenStore get tokenStore;

  Function get onSessionExpire;

  Future<SignupResponse> signup(SignupRequest payload);

  Future<LoginResponse> login(LoginRequest payload);

  Future<Empire> getMyEmpire();

  Future<Empire> firstCity();

  Future<City> getMyCityById(int cityId, {City city});

  Future<void> constructBuilding(int cityId, Position position, int type);

  Future<void> upgradeBuilding(int cityId, int buildingId, int level);

  Future<void> completeBuildingUpgrade(int cityId, int buildingId);

  Future<void> cancelBuildingUpgrade(int cityId, int buildingId);

  Future<void> moveBuilding(int cityId, int buildingId, Position newPosition);

  Future<void> demolishBuilding(int cityId, int buildingId);

  Future<void> constructTower(int cityId, Position position, int type);

  Future<void> upgradeTower(int cityId, int towerId, int level);

  Future<void> completeTowerUpgrade(int cityId, int towerId);

  Future<void> cancelTowerUpgrade(int cityId, int towerId);

  Future<void> moveTower(int cityId, int towerId, Position newPosition);

  Future<void> demolishTower(int cityId, int towerId);

  Future<void> recruit(int cityId, int type, int count);

  Future<void> completeRecruitment(int cityId, int recruitmentId);

  Future<void> cancelRecruitment(int cityId, int recruitmentId);

  Future<void> dismissFighters(int cityId, int type, int count);

  Future<World> getWorld();
}

class _ApiImpl with AuthApi, CityApi, PlayerApi, TowerApi implements Api {
  @override
  final String baseUrl;

  @override
  final TokenStore tokenStore;

  @override
  final Function onSessionExpire;

  _ApiImpl({TokenStore tokenStore, this.baseUrl: '', this.onSessionExpire})
      : tokenStore = tokenStore ?? _TokenStoreImpl();
}

abstract class TokenStore {
  void store(String token);

  String load();
}

class _TokenStoreImpl implements TokenStore {
  String _token;

  @override
  void store(String token) => _token = token;

  @override
  String load() => _token;
}
