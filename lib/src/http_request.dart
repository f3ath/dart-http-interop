import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';

/// The request which is sent by the client and received by the server
class HttpRequest extends HttpMessage {
  HttpRequest(String method, this.uri,
      {String body = '', Map<String, String> headers = const {}})
      : method = method.toLowerCase(),
        super(body, HttpHeaders(headers));

  HttpRequest.binary(String method, this.uri, Uint8List bodyBytes,
      {Map<String, String> headers = const {}})
      : method = method.toLowerCase(),
        super.binary(bodyBytes, HttpHeaders(headers));

  /// Requested URI
  final Uri uri;

  /// Request method, lowercase
  final String method;

  bool get isGet => method == 'get';

  bool get isPost => method == 'post';

  bool get isDelete => method == 'delete';

  bool get isPatch => method == 'patch';

  bool get isOptions => method == 'options';
}
