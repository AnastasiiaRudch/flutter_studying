import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_config.dart';

class AuthService {
  static const FlutterAppAuth _appAuth = FlutterAppAuth();
  static const FlutterSecureStorage _storage =
      FlutterSecureStorage(); // 🔁 static

  Future<void> login() async {
    final result = await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        CLIENT_ID,
        REDIRECT_URI,
        discoveryUrl: DISCOVERY_URL,
        scopes: ['openid', 'profile', 'email', 'offline_access'],
        promptValues: ['login'],
      ),
    );

    if (result != null) {
      await _persistToken(result);
    }
  }

  Future<void> _persistToken(TokenResponse result) async {
    await _storage.write(key: 'access_token', value: result.accessToken);
    await _storage.write(key: 'refresh_token', value: result.refreshToken);
    await _storage.write(
      key: 'access_token_expiration',
      value: result.accessTokenExpirationDateTime?.toIso8601String(),
    );
  }

  Future<String?> getAccessToken() async {
    final expiryStr = await _storage.read(key: 'access_token_expiration');
    if (expiryStr != null &&
        DateTime.parse(expiryStr).isBefore(DateTime.now())) {
      // access_token expired — refresh it
      await _refreshToken();
    }

    return await _storage.read(key: 'access_token');
  }

  Future<void> _refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return;

    final response = await _appAuth.token(
      TokenRequest(
        CLIENT_ID,
        REDIRECT_URI,
        refreshToken: refreshToken,
        discoveryUrl: DISCOVERY_URL,
        scopes: ['openid', 'profile', 'email', 'offline_access'],
      ),
    );

    if (response != null) {
      await _persistToken(response);
    }
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null;
  }

  Future<bool> refreshIfNeeded() async {
    final expiryStr = await _storage.read(key: 'access_token_expiration');
    if (expiryStr == null ||
        DateTime.parse(expiryStr).isAfter(DateTime.now())) {
      return false;
    }
    try {
      await _refreshToken();
      return true;
    } catch (_) {
      return false;
    }
  }
}
