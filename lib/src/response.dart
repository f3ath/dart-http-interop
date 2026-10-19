import 'package:http_interop/http_interop.dart';

/// An HTTP response sent by a server and received by a client.
final class Response(
  /// The HTTP status code.
  final int statusCode,
  super.body,
  super.headers,
) extends Message;
