import 'package:http_interop/src/http_request.dart';
import 'package:http_interop/src/http_response.dart';

abstract interface class HttpHandler {
  Future<HttpResponse> handle(HttpRequest request);
}
