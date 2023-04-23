import 'package:http_interop/src/http_request.dart';
import 'package:http_interop/src/http_response.dart';

abstract class HttpHandler {
  Future<HttpResponse> handle(HttpRequest request);
}
