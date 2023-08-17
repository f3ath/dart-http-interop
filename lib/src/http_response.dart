import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';

/// The response sent by the server and received by the client
class HttpResponse extends HttpMessage {
  /// Creates a new instance with the [body] provided as a string.
  /// If [encoding] is provided, it will be used to create the binary
  /// representation of the message body. Otherwise, the encoding will be
  /// derived from the [headers].
  HttpResponse(this.statusCode, String body,
      {Map<String, String> headers = const {}, Encoding? encoding})
      : super(body, HttpHeaders(headers), encoding);

  /// Creates a new instance with the [bodyBytes].
  HttpResponse.binary(this.statusCode, Uint8List bodyBytes,
      {Map<String, String> headers = const {}})
      : super.binary(bodyBytes, HttpHeaders(headers));

  /// Response status code
  final int statusCode;
}
