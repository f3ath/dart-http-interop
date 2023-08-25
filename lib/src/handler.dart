import 'package:http_interop/src/request.dart';
import 'package:http_interop/src/response.dart';

/// Each client and server compatible with this package is supposed
/// to implement this interface.
abstract interface class Handler {
  Future<Response> handle(Request request);
}
