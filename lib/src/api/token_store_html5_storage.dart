import 'dart:html';

import 'package:common/api.dart';

class TokenStoreSessionStorage implements TokenStore {
  @override
  void store(String token) {
    window.sessionStorage['auth.token'] = token;
  }

  @override
  String load() {
    return window.sessionStorage['auth.token'];
  }
}

class TokenStoreLocalStorage implements TokenStore {
  @override
  void store(String token) {
    window.sessionStorage['auth.token'] = token;
  }

  @override
  String load() {
    return window.sessionStorage['auth.token'];
  }
}