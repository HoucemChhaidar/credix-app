class AppEndpoints {
  // static const String _baseUrl = 'http://192.168.1.15:2345';
  static const String _baseUrl = 'http://172.16.0.61:2345';
  // static const String _baseUrl = 'http://192.168.217.129:2345';

  static const String _auth = '$_baseUrl/auth';
  static const String _api = '$_baseUrl/api';
  static const String _wallets = '$_api/wallets';

  static const String login = '$_auth/login';
  static const String register = '$_auth/register';
  static const String myWallet = '$_wallets/my-wallet';
}
