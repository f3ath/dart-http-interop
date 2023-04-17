import 'package:http_interop/src/headers.dart';

/// HTTP message. Request or Response.
class Message with Headers {
  Message(this.body);

  /// Message body
  final String body;
}
