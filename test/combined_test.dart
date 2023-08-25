import 'dart:convert';

import 'package:http_interop/extensions.dart';
import 'package:http_interop/http_interop.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Request', () {
    test('ctor', () async {
      final r = Request(Method('get'), Uri(), Body.empty(), Headers({}));
      expect(await r.body.decode(utf8), isEmpty);
      expect(r.headers, isEmpty);
    });
  });
  group('Response', () {
    test('ctor', () async {
      final r = Response(200, Body('привет', utf8), Headers({}));
      expect(await r.body.decode(utf8), equals('привет'));
      expect(r.headers, isEmpty);
    });
  });
  group('Method', () {
    test('can not be empty', () {
      expect(() => Method(''), throwsArgumentError);
    });
  });
  group('Headers', () {
    test('are case-insensitive', () {
      final headers = Headers({
        'Accept': ['text/plain']
      });
      expect(headers['Accept']?.first, equals('text/plain'));
      expect(headers['accept']?.first, equals('text/plain'));
      expect(headers['AcCePt']?.first, equals('text/plain'));
    });
  });
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
