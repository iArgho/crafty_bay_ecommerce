import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> getRequest(
    String url, {
    Map<String, dynamic>? queryParams,
    String? accessToken,
  }) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      Uri uri = Uri.parse(url);
      if (queryParams != null) {
        uri = uri.replace(
          queryParameters:
              queryParams.map((key, value) => MapEntry(key, value.toString())),
        );
      }

      _logRequest(uri.toString(), headers);

      Response response = await get(uri, headers: headers);

      _logResponse(
          uri.toString(), response.statusCode, response.headers, response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedMessage,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Request failed with status ${response.statusCode}',
        );
      }
    } catch (e) {
      _logResponse(url, -1, null, '', e.toString());
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
    String? accessToken,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      _logRequest(uri.toString(), headers, body);

      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      _logResponse(
          uri.toString(), response.statusCode, response.headers, response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedMessage,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Request failed with status ${response.statusCode}',
        );
      }
    } catch (e) {
      _logResponse(url, -1, null, '', e.toString());
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url,
      [Map<String, dynamic>? headers, Map<String, dynamic>? body]) {
    _logger.i('REQUEST =>\nURL: $url\nHeaders: $headers\nBody: $body');
  }

  void _logResponse(
    String url,
    int statusCode,
    Map<String, String>? headers,
    String body, [
    String? errorMessage,
  ]) {
    if (errorMessage != null) {
      _logger.e('RESPONSE ERROR =>\nURL: $url\nError: $errorMessage');
    } else {
      _logger.i(
          'RESPONSE =>\nURL: $url\nStatus: $statusCode\nHeaders: $headers\nBody: $body');
    }
  }
}
