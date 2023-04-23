import 'package:http_interop/src/http_handler.dart';
import 'package:http_interop/src/http_request.dart';
import 'package:http_interop/src/http_response.dart';

/// A wrapper over [HttpHandler] which allows logging
class LoggingHandler implements HttpHandler {
  LoggingHandler(this.handler, {this.onRequest, this.onResponse});

  final HttpHandler handler;
  final Function(HttpRequest request)? onRequest;
  final Function(HttpResponse response)? onResponse;

  @override
  Future<HttpResponse> handle(HttpRequest request) async {
    onRequest?.call(request);
    final response = await handler.handle(request);
    onResponse?.call(response);
    return response;
  }
}
