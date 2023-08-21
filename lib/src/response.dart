import 'package:http_interop/http_interop.dart';

/// The response sent by the server and received by the client
class Response extends Message {
  Response(this.statusCode, super.body, super.headers);

  /// Response status code
  final int statusCode;
}
