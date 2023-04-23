import 'package:http_interop/src/http_message.dart';

/// The response sent by the server and received by the client
class HttpResponse extends HttpMessage {
  HttpResponse(this.statusCode, {String body = ''}) : super(body);

  /// Response status code
  final int statusCode;
}
