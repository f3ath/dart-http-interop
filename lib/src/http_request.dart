import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';

/// The request which is sent by the client and received by the server
final class HttpRequest extends HttpMessage {
  HttpRequest(String method, this.uri, String body,
      {Map<String, String> headers = const {}})
      : method = HttpMethod(method),
        super(body, HttpHeaders(headers));

  HttpRequest.binary(String method, this.uri, Uint8List body,
      {Map<String, String> headers = const {}})
      : method = HttpMethod(method),
        super.binary(body, HttpHeaders(headers));

  /// Requested URI
  final Uri uri;

  /// Request method.
  final HttpMethod method;
}
