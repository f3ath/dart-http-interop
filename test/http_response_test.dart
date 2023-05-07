import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('HttpResponse', () {
    test('body is set', () {
      final r = HttpResponse(200, body: 'foo');
      expect(r.body, equals('foo'));
    });
    test('binary body is set', () {
      final bodyBytes = Uint8List.fromList([0, 1, 2, 3, 254, 255]);
      final r = HttpResponse.binary(200, bodyBytes);
      expect(r.bodyBytes, equals(bodyBytes));
    });
  });
}
