import 'package:meta/meta.dart';
import 'package:jaguar_validate/jaguar_validate.dart';

class SignupRequest implements Validatable {
  final String name;

  final String email;

  final String password;

  SignupRequest(
      {@required this.name, @required this.email, @required this.password});

  static SignupRequest fromMap(Map map) {
    if (map == null) return null;

    return SignupRequest(
        name: map['name'], email: map['email'], password: map['password']);
  }

  @override
  ObjectErrors validate() {
    final ret = ObjectErrors();
    ret['name'] = validateValue(name, [
      isNotNull(),
      isNotEmpty(),
      hasMinLength(3),
      hasMaxLength(10),
      matchesRegExp(RegExp(r'^[a-zA-Z0-9._-]*$'))
    ]);
    ret['email'] =
        validateValue(email, [isNotNull(), isNotEmpty(), isEmailAddress()]);
    ret['password'] = validateValue(password, [
      isNotNull(),
      isNotEmpty(),
      hasMinLength(5),
      hasMaxLength(150),
      maxRepeatedCharacters(allowedRepeats: 2)
    ]);
    return ret;
  }
}

class SignupResponse {
  final String email;

  SignupResponse({this.email});

  static SignupResponse fromMap(Map map) => SignupResponse(email: map['email']);

  Map<String, dynamic> toJson() => {'email': email};
}

class LoginRequest implements Validatable {
  final String email;

  final String password;

  LoginRequest({this.email, this.password});

  static LoginRequest fromMap(Map map) =>
      LoginRequest(email: map['email'], password: map['password']);

  @override
  ObjectErrors validate() {
    final ret = ObjectErrors();
    ret['email'] =
        validateValue(email, [isNotNull(), isNotEmpty(), isEmailAddress()]);
    ret['password'] = validateValue(password, [
      isNotNull(),
      isNotEmpty(),
      hasMinLength(5),
      hasMaxLength(150),
      maxRepeatedCharacters(allowedRepeats: 2)
    ]);
    return ret;
  }
}

class LoginResponse {
  final String token;

  LoginResponse({this.token});

  Map<String, dynamic> toJson() => {'token': token};

  static LoginResponse fromMap(Map map) => LoginResponse(token: map['token']);
}
