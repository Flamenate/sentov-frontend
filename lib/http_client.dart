import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPClient extends http.BaseClient {
  HTTPClient();

  final http.Client _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['content-type'] = 'application/json; charset=UTF-8';
    return _client.send(request);
  }
}

class JsonError extends Error {
  final String message;
  final Map<String, dynamic> response;
  JsonError(this.message, this.response);

  static fromResponse(http.Response response) {
    try {
      final body = jsonDecode(response.body);
      return JsonError(body['error'] ?? "error", body);
    } catch (e) {
      return JsonError('error', {});
    }
  }
}
