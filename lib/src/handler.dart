import 'package:http_interop/src/request.dart';
import 'package:http_interop/src/response.dart';

abstract class Handler {
  Future<Response> handle(Request request);
}
