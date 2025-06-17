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

  static const String _usernameKey = 'saved_username';
  static const String _passwordKey = 'saved_password';
  static const String _rememberCredentialsKey = 'remember_credentials';

  // Save credentials
  static Future<void> saveCredentials({
    required String username,
    required String password,
  }) async {
    await _storage.write(key: _usernameKey, value: username);
    await _storage.write(key: _passwordKey, value: password);
    await _storage.write(key: _rememberCredentialsKey, value: 'true');
  }

  // Get saved credentials
  static Future<Map<String, String?>> getSavedCredentials() async {
    final username = await _storage.read(key: _usernameKey);
    final password = await _storage.read(key: _passwordKey);
    final rememberCredentials = await _storage.read(key: _rememberCredentialsKey);

    return {
      'username': username,
      'password': password,
      'rememberCredentials': rememberCredentials,
    };
  }

  // Clear saved credentials
  static Future<void> clearCredentials() async {
    await _storage.delete(key: _usernameKey);
    await _storage.delete(key: _passwordKey);
    await _storage.delete(key: _rememberCredentialsKey);
  }

  // Check if credentials should be remembered
  static Future<bool> shouldRememberCredentials() async {
    final remember = await _storage.read(key: _rememberCredentialsKey);
    return remember == 'true';
  }
}
