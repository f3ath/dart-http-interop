import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/src/http_headers.dart';

/// An HTTP message where the body is known.
class HttpMessage {
  /// Creates a new instance with the [body] provided as a string.
  /// If [encoding] is provided, it will be used to create the binary
  /// representation of the message body. Otherwise, the encoding will be
  /// derived from the [headers].
  HttpMessage(String body, this.headers, Encoding? encoding)
      : bodyBytes =
            Uint8List.fromList((encoding ?? headers.encoding).encode(body));

  /// Creates a new instance with the [bodyBytes].
  HttpMessage.binary(this.bodyBytes, this.headers);

  /// Message headers.
  final HttpHeaders headers;

  /// The bytes comprising the body of this response.
  final Uint8List bodyBytes;

  /// The string representation of the message body, decoded dynamically
  /// using the encoding derived from [headers].
  String get body => headers.encoding.decode(bodyBytes);
}
