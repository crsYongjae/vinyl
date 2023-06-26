import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class BaseApiClient extends http.BaseClient {
  final http.Client _delegate = http.Client();
  final Logger _logger = Logger();

  BaseApiClient();

  @override
  void close() {
    _delegate.close();
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    String s = "url: $url";
    s += "\nrequestAt: ${DateTime.now().toString()}";
    final response = await _delegate.get(url, headers: headers);
    s += "\nheader: $headers";
    s += "\nresponse header: ${response.headers}";
    s += "\nresponse body: ${response.body}";
    _logger.i(s);
    return response;
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {

    String s = "url: $url";
    s += "\nrequestAt: ${DateTime.now().toString()}";
    final response = await _delegate.post(url,
        headers: headers, body: body, encoding: encoding);
    s += "\nheader: $headers";
    s += "\nbody: $body";
    s += "\nresponse header: ${response.headers}";
    s += "\nresponse body: ${response.body}";
    _logger.i(s);
    return response;
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {

    String s = "url: $url";
    s += "\nrequestAt: ${DateTime.now().toString()}";
    final response = await _delegate.put(url,
        headers: headers, body: body, encoding: encoding);
    s += "\nheader: $headers";
    s += "\nbody: $body";
    s += "\nresponse header: ${response.headers}";
    s += "\nresponse body: ${response.body}";
    _logger.i(s);
    return response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String s = "${request.method} ${request.url} -->";
    s += "\nrequestAt: ${DateTime.now().toString()}";
    s += "\nheader: ${request.headers}";
    if (request is http.Request && request.body.isNotEmpty) {
      s += "\nbody: ${request.body}";
    }
    _logger.i(s);
    final response = await _delegate.send(request);
    s = "${request.method} ${request.url} <--";
    s += "\nheader: ${response.headers}";

    if (request is http.Request) {
      final List<int> bytes = await response.stream.toBytes();
      s += "\nbody: ${utf8.decode(bytes)}";
      _logger.i(s);
      return http.StreamedResponse(
          http.ByteStream.fromBytes(bytes), response.statusCode,
          contentLength: response.contentLength,
          request: request,
          headers: response.headers,
          isRedirect: response.isRedirect,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase);
    }
    _logger.i(s);
    return response;
  }
}