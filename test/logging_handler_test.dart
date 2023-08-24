import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('LoggingHandler', () {
    test('can log', () async {
      final tx = <Request>[];
      final rx = <Response>[];
      final handler =
          LoggingHandler(OkHandler(), onRequest: tx.add, onResponse: rx.add);
      final request = Request(Method('GET'), Uri.parse('https://example.com'),
          Body.empty(), Headers({'accept': 'text/plain'}));
      final response = await handler.handle(request);
      expect(tx, equals([request]));
      expect(rx, equals([response]));
    });
  });
}

class OkHandler implements Handler {
  @override
  Future<Response> handle(Request request) async =>
      Response(200, Body.empty(), Headers({'content-type': 'text/plain'}));
}
