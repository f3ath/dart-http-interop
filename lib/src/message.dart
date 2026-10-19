import 'package:http_interop/src/body.dart';
import 'package:http_interop/src/headers.dart';

/// An HTTP message with a body and headers.
class Message(
  /// The message body.
  final Body body,

  /// Message headers.
  final Headers headers,
) {
  /// Additional context shared between handlers.
  ///
  /// This context is not part of the HTTP message.
  final context = <String, Object?>{};
}
