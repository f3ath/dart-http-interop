import 'package:http_interop/src/body.dart';
import 'package:http_interop/src/headers.dart';

/// An HTTP message where the body is known.
class Message {
  Message(this.body, this.headers);

  /// Message headers.
  final Headers headers;

  /// The bytes comprising the body of this response.
  final Body body;

  /// Any additional context for this message. This is not part of the HTTP
  /// message itself, but can be used to pass information between handlers.
  final context = <String, Object?>{};
}
