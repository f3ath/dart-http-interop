import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('HttpMethod', () {
    test('equality', () {
      expect(HttpMethod('get'), equals(HttpMethod('GeT')));
      expect(HttpMethod('get'), isNot(equals(HttpMethod('post'))));
      expect(HttpMethod('get').equals('GET'), isTrue);
      expect(HttpMethod('get').equals('get'), isTrue);
      expect(HttpMethod('get').equals('post'), isFalse);
    });
    test('toString', () {
      expect(HttpMethod('get').toString(), equals('GET'));
    });
    test('hashCode', () {
      expect({HttpMethod('get'), HttpMethod('GET')}.length, equals(1));
    });
  });
}
