import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Method', () {
    test('equality', () {
      expect(Method('get'), equals(Method('GeT')));
      expect(Method('get'), isNot(equals(Method('post'))));
      expect(Method('get').equals('GET'), isTrue);
      expect(Method('get').equals('get'), isTrue);
      expect(Method('get').equals('post'), isFalse);
    });
    test('toString', () {
      expect(Method('get').toString(), equals('get'));
    });
    test('hashCode', () {
      expect({Method('get'), Method('GET')}.length, equals(1));
    });
  });
}
