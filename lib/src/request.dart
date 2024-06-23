import 'package:http_interop/http_interop.dart';

/// The request which is sent by the client and received by the server
final class Request extends Message {
  Request(String method, this.uri, super.body, super.headers)
      : method = method.toLowerCase() {
    if (method.trim().isEmpty) {
      throw ArgumentError('Method name cannot be empty', 'method');
    }
  }

  /// Requested URI
  final Uri uri;

  /// Request method, lowercase.
  final String method;
}
