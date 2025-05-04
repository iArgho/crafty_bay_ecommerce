class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';

  static String get baseUrl => _baseUrl;
  static verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
}