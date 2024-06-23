import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/extensions.dart';
import 'package:http_interop/http_interop.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Request', () {
    test('ctor', () async {
      final r = Request('gEt', Uri(), Body(), Headers());
      expect(await r.body.decode(utf8), isEmpty);
      expect(r.headers, isEmpty);
      expect(r.method, equals('get'));
    });
    test('method cn not be empty', () {
      expect(() => Request(' ', Uri(), Body(), Headers()), throwsArgumentError);
    });
  });

  group('Response', () {
    test('ctor', () async {
      final r = Response(200, Body.text('привет', utf8), Headers());
      expect(await r.body.decode(utf8), equals('привет'));
      expect(r.headers, isEmpty);
    });
  });

  group('Headers', () {
    test('are case-insensitive', () {
      final headers = Headers.from({
        'Accept': ['text/plain']
      });
      expect(headers['Accept']?.first, equals('text/plain'));
      expect(headers['accept']?.first, equals('text/plain'));
      expect(headers['AcCePt']?.first, equals('text/plain'));
    });
    test('empty', () {
      expect(Headers(), isEmpty);
    });
    test('fromEntries', () {
      expect(
          Headers.fromEntries({
            'foo': ['bar'],
          }.entries)['foo'],
          equals('bar'));
    });
  });

  group('Body', () {
    const object = {
      'foo': [1, 2, true, 'Привет']
    };
    const json = '{"foo":[1,2,true,"Привет"]}';
    test('json encode', () async {
      expect(await Body.json(object).decode(utf8), equals(json));
    });
    test('json encode/decode', () async {
      expect(await Body.text(json, utf8).decodeJson(), equals(object));
    });
    test('stream', () async {
      final stream = Stream.value(Uint8List.fromList(ascii.encode('Hello')));
      final body = Body.stream(stream);
      expect(await body.decode(ascii), equals('Hello'));
    });
    test('empty body has empty stream', () async {
      expect(await Body().bytes.isEmpty, isTrue);
      expect(await Body.text('', utf8).bytes.isEmpty, isTrue);
      expect(await Body.binary(Uint8List(0)).bytes.isEmpty, isTrue);
    });
  });
}
