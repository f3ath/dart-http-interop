import 'package:http_interop/src/handler.dart';
import 'package:http_interop/src/request.dart';
import 'package:http_interop/src/response.dart';

/// A wrapper over [Handler] which allows logging
class LoggingHandler implements Handler {
  LoggingHandler(this.handler, {this.onRequest, this.onResponse});

  final Handler handler;
  final Function(Request request)? onRequest;
  final Function(Response response)? onResponse;

  @override
  Future<Response> handle(Request request) async {
    onRequest?.call(request);
    final response = await handler.handle(request);
    onResponse?.call(response);
    return response;
  }
}
