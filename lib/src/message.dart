import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/src/headers.dart';

/// An HTTP message where the body is known.
class Message {
  Message(this.body, this.headers);

  /// Message headers.
  final Headers headers;

  /// The bytes comprising the body of this response.
  final Body body;
}

class Body {
  Body(String text, Encoding encoding)
      : this.binary(Uint8List.fromList(encoding.encode(text)));

  Body.binary(Uint8List bytes) : this.stream(Stream.value(bytes));

  Body.stream(this.bytes);

  static final empty = Body.binary(Uint8List(0));

  Stream<Uint8List> bytes;
}
