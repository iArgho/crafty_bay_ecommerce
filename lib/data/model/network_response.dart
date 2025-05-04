
class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? responseJson;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseJson,
  });
}
