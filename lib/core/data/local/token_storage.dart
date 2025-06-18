import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _tokenKey = 'jwt_token';

  // Save JWT token and user info
  static Future<void> saveAuthData({
    required String token,
  }) async {
    await Future.wait([
      _storage.write(key: _tokenKey, value: token),
    ]);
  }

  // Get JWT token
  static Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  // Check if user is authenticated
  static Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // Clear all auth data
  static Future<void> clearAuthData() async {
    await Future.wait([
      _storage.delete(key: _tokenKey),
    ]);
  }
}
