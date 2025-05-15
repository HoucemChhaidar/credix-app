class AppEndpoints {
  static const String _baseUrl = 'http://172.16.0.69:2345';

  // static const String _baseUrl = 'http://192.168.1.14:2345';

  static const String _auth = '$_baseUrl/auth';
  static const String login = '$_auth/login';
  static const String register = '$_auth/register';
}
