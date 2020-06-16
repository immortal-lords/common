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

class LoginRequest implements Validatable {
  final String name;

  final String password;

  LoginRequest({this.name, this.password});

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
