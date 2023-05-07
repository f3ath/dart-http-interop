import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';

/// An HTTP message where the body is known.
class HttpMessage {
  HttpMessage(String body, this.headers)
      : bodyBytes =
            Uint8List.fromList((headers.encoding ?? latin1).encode(body));

  HttpMessage.binary(this.bodyBytes, this.headers);

  /// Message headers.
  final HttpHeaders headers;

  /// The bytes comprising the body of this response.
  final Uint8List bodyBytes;

  /// Message body.
  String get body => (headers.encoding ?? latin1).decode(bodyBytes);
}
