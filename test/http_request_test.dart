import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('HttpRequest', () {
    test('body is set', () {
      final r = HttpRequest('get', Uri(), 'foo');
      expect(r.body, equals('foo'));
    });
    test('body is set in UTF', () {
      final r = HttpRequest('get', Uri(), 'привет', headers: {
        'Content-Type': 'text/plain; charset=utf-8',
      });
      expect(r.body, equals('привет'));
    });
    test('binary body is set', () {
      final bodyBytes = Uint8List.fromList([0, 1, 2, 3, 254, 255]);
      final r = HttpRequest.binary('get', Uri(), bodyBytes);
      expect(r.bodyBytes, equals(bodyBytes));
    });
  });
}
