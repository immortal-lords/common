import 'package:common/common.dart';
import 'package:common/src/api/auth.dart';
import 'package:common/src/api/city.dart';
import 'package:common/src/api/empire.dart';
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

  Future<City> getMyCityById(int cityId);

  Future<Building> construct(int cityId, Position position, int type);

  Future<void> upgrade(int cityId, int buildingId, int level);

  Future<void> demolish(int cityId, int buildingId);
}

class _ApiImpl with AuthApi, CityApi, PlayerApi implements Api {
  @override
  final String baseUrl;

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
