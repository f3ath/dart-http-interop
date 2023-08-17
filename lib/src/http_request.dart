import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';

/// The request which is sent by the client and received by the server
class HttpRequest extends HttpMessage {
  /// Creates a new instance with the [body] provided as a string.
  /// If [encoding] is provided, it will be used to create the binary
  /// representation of the message body. Otherwise, the encoding will be
  /// derived from the [headers].
  HttpRequest(String method, this.uri, String body,
      {Map<String, String> headers = const {}, Encoding? encoding})
      : method = HttpMethod(method),
        super(body, HttpHeaders(headers), encoding);

  /// Creates a new instance with the [bodyBytes].
  HttpRequest.binary(String method, this.uri, Uint8List bodyBytes,
      {Map<String, String> headers = const {}})
      : method = HttpMethod(method),
        super.binary(bodyBytes, HttpHeaders(headers));

  /// Requested URI
  final Uri uri;

  /// Request method.
  final HttpMethod method;
}
