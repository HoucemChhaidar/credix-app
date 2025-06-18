import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CredentialsStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _emailKey = 'saved_email';
  static const String _passwordKey = 'saved_password';
  static const String _rememberMeKey = 'remember_me';

  // Save credentials
  static Future<void> saveCredentials({
    required String email,
    required String password,
  }) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _passwordKey, value: password);
    await _storage.write(key: _rememberMeKey, value: 'true');
  }

  // Get saved credentials
  static Future<Map<String, String?>> getSavedCredentials() async {
    final email = await _storage.read(key: _emailKey);
    final password = await _storage.read(key: _passwordKey);
    final rememberMe = await _storage.read(key: _rememberMeKey);

    return {
      'email': email,
      'password': password,
      'rememberMe': rememberMe,
    };
  }

  // Clear saved credentials
  static Future<void> clearCredentials() async {
    await _storage.delete(key: _emailKey);
    await _storage.delete(key: _passwordKey);
    await _storage.delete(key: _rememberMeKey);
  }
}
