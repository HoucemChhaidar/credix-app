class AppEndpoints {
  static const String serverHost = '192.168.100.18:2345';

  static const String baseUrl = 'http://$serverHost';
  static const String wsBaseUrl = 'ws://$serverHost';

  static const String _auth = '$baseUrl/auth';
  static const String _api = '$baseUrl/api';
  static const String _wallets = '$_api/wallets';

  static const String login = '$_auth/login';
  static const String register = '$_auth/register';
  static const String myWallet = '$_wallets/my-wallet';
}
