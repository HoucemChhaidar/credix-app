class AppEndpoints {
  static const String _serverHost = '192.168.100.18';
  static const String _port = '2345';

  static const String _baseUrl = 'http://$_serverHost:$_port';
  static const String wsBaseUrl = 'ws://$_serverHost:$_port';

  static const String _auth = '$_baseUrl/auth';
  static const String _api = '$_baseUrl/api';
  static const String _wallets = '$_api/wallets';
  static const String _transactions = '$_api/transactions';

  static const String login = '$_auth/login';
  static const String register = '$_auth/register';
  static const String myWallet = '$_wallets/my-wallet';
  static const String myTransactionsHistory = '$_transactions/history';
}
