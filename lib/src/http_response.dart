import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';

/// The response sent by the server and received by the client
final class HttpResponse extends HttpMessage {
  HttpResponse(this.statusCode, String body,
      {Map<String, String> headers = const {}})
      : super(body, HttpHeaders(headers));

  HttpResponse.binary(this.statusCode, Uint8List body,
      {Map<String, String> headers = const {}})
      : super.binary(body, HttpHeaders(headers));

  /// Response status code
  final int statusCode;
}
