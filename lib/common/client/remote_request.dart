import 'dart:convert';
import 'dart:developer';
import '../exceptions/custom_exceptions.dart';
import '../utils/logging.dart';
import 'package:http/http.dart' as http_client;

import 'http_method_enum.dart';

abstract class RemoteRequest {
  Future<dynamic> call({
    required HttpMethod httpMethod,
    required String host,
    required String endpointWithPath,
    required Map<String, String> httpHeaders,
    required bool isHttps,
    String? hostPath,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });
}

class RemoteRequestImpl implements RemoteRequest {
  @override
  Future<dynamic> call({
    required HttpMethod httpMethod,
    required String host,
    required String endpointWithPath,
    required Map<String, String> httpHeaders,
    required bool isHttps,
    String? hostPath,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    final httpRequest = _MyHttpRequest(
      httpMethod: httpMethod,
      host: host,
      hostPath: hostPath,
      endpointWithPath: endpointWithPath,
      httpHeaders: httpHeaders,
      queryParameters: queryParameters,
      body: body,
      isHttps: isHttps,
    );

    return httpRequest();
  }
}

class _MyHttpRequest {
  final String host;
  final String? hostPath;
  final String endpointWithPath;
  final HttpMethod httpMethod;
  final Map<String, String> httpHeaders;
  final Map<String, dynamic>? queryParameters;
  final dynamic body;
  final bool isHttps;
  late Uri uri;

  _MyHttpRequest({
    required this.host,
    this.hostPath,
    required this.endpointWithPath,
    required this.httpHeaders,
    required this.httpMethod,
    required this.isHttps,
    this.queryParameters,
    this.body,
  }) {
    uri = _createUri(
      host,
      isHttps,
      hostPath,
    );
  }

  dynamic call() async {
    _logRequest();

    final response = await _makeRequest();

    _checkResponse(response);

    final responseAsJson = _decodeResponseToJson(response);
    return responseAsJson;
  }

  Uri _createUri(String host, bool isHttps, String? hostPath) {
    final fullPath =
        hostPath != null ? '$hostPath$endpointWithPath' : endpointWithPath;
    return isHttps
        ? Uri.https(host, fullPath, queryParameters)
        : Uri.http(host, fullPath, queryParameters);
  }

  void _logRequest() {
    logger.info('${httpMethod.methodName} ${uri.toString()}');
  }

  Future<http_client.Response> _makeRequest() {
    final encodedBody = jsonEncode(body);
    return httpMethod.methodFunction(
      url: uri,
      headers: httpHeaders,
      body: encodedBody,
    );
  }

  dynamic _decodeResponseToJson(http_client.Response response) {
    return response.body.isNotEmpty
        ? json.decode(utf8.decode(response.bodyBytes))
        : null;
  }

  void _checkResponse(http_client.Response response) {
    if (response.statusCode.toString()[0] == '5') {
      final exceptionMessage =
          'Server exception, method: ${httpMethod.methodName}, uri: ${uri.toString()}, status code: ${response.statusCode}, body: ${response.body}';
      logger.severe(exceptionMessage);
      throw CustomServerErrorException('Server error, try later');
    }
  }
}
