import 'package:common/src/api/api.dart';
import 'package:common/src/model/auth.dart';
import 'package:jaguar_resty/jaguar_resty.dart';

import 'package:http/io_client.dart';

Future<void> main() async {
  globalClient = IOClient();
  final api = Api(baseUrl: 'http://localhost:15000/');
  await api
      .login(LoginRequest(email: 'knight@example.com', password: 'S3cr3t'));
  final empire = await api.getMyEmpire();
  print(empire);

  final city = await api.getMyCityById(empire.cities[0].id);
  print(city);

  // TODO
}
