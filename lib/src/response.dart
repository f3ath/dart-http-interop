import 'package:http_interop/src/message.dart';

/// The response sent by the server and received by the client
class Response extends Message {
  Response(this.statusCode, {String body = ''}) : super(body);

  /// Response status code
  final int statusCode;
}
