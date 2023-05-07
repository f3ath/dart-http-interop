import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('LoggingHandler', () {
    test('can log', () async {
      final tx = <HttpRequest>[];
      final rx = <HttpResponse>[];
      final handler =
          LoggingHandler(OkHandler(), onRequest: tx.add, onResponse: rx.add);
      final request = HttpRequest('GET', Uri.parse('https://example.com'), '')
        ..headers['accept'] = 'text/plain';
      final response = await handler.handle(request);
      expect(tx, equals([request]));
      expect(rx, equals([response]));
    });
  });
}

class OkHandler implements HttpHandler {
  @override
  Future<HttpResponse> handle(HttpRequest request) async =>
      HttpResponse(200, 'OK')..headers['content-type'] = 'text/plain';
}
