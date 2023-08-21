import 'package:http_interop/http_interop.dart';

/// The request which is sent by the client and received by the server
class Request extends Message {
  Request(this.method, this.uri, super.body, super.headers);

  /// Requested URI
  final Uri uri;

  /// Request method.
  final Method method;
}
