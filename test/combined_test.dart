import 'dart:convert';
import 'dart:typed_data';

import 'package:http_interop/extensions.dart';
import 'package:http_interop/http_interop.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Request', () {
    test('ctor', () async {
      final r = Request('gEt', Uri(), Body.empty(), Headers());
      expect(await r.body.decode(utf8), isEmpty);
      expect(r.headers, isEmpty);
      expect(r.method, equals('gEt'));
    });
  });

  group('Response', () {
    test('ctor', () async {
      final r = Response(200, Body.text('привет'), Headers());
      expect(await r.body.decode(utf8), equals('привет'));
      expect(r.headers, isEmpty);
    });
  });

  group('Headers', () {
    test('are case-insensitive', () {
      final headers = Headers.from({
        'Accept': ['text/plain'],
      });
      expect(headers['Accept']?.first, equals('text/plain'));
      expect(headers['accept']?.first, equals('text/plain'));
      expect(headers['AcCePt']?.first, equals('text/plain'));
    });
    test('empty', () {
      expect(Headers(), isEmpty);
    });
    for (final create in <String, Headers Function(Map<String, List<String>>)>{
      'assignment': (source) => Headers()..addAll(source),
      'from': Headers.from,
      'fromEntries': (source) => Headers.fromEntries(source.entries),
    }.entries) {
      test('${create.key} preserves empty field values', () {
        final headers = create.value({
          'X-Empty': [''],
          'X-Mixed': ['', 'value', ''],
          'X-No-Values': [],
        });

        expect(headers['x-empty'], equals(['']));
        expect(headers['x-mixed'], equals(['', 'value', '']));
        expect(headers['x-no-values'], isEmpty);
        expect(headers['x-missing'], isNull);
      });
    }
    test('fromEntries', () {
      expect(
        Headers.fromEntries(
          {
            'foo': ['bar'],
          }.entries,
        )['foo'],
        equals(['bar']),
      );
    });
  });

  group('Body', () {
    const object = {
      'foo': [1, 2, true, 'Привет'],
    };
    const json = '{"foo":[1,2,true,"Привет"]}';
    test('json encode', () async {
      expect(await Body.json(object).decode(utf8), equals(json));
    });
    test('json encode/decode', () async {
      expect(await Body.text(json).decodeJson(), equals(object));
    });
    test('stream', () async {
      final stream = Stream.value(Uint8List.fromList(ascii.encode('Hello')));
      final body = Body(stream);
      expect(await body.decode(ascii), equals('Hello'));
    });
    test('decode accepts a body exactly at the byte limit across chunks', () async {
      final body = Body(
        Stream.fromIterable([
          Uint8List.fromList([72, 101]),
          Uint8List.fromList([108, 108, 111]),
        ]),
      );
      expect(await body.decode(utf8, maxBytes: 5), 'Hello');
    });
    test('decode rejects a body exceeding the cumulative byte limit', () async {
      var reachedEnd = false;
      Stream<Uint8List> chunks() async* {
        yield Uint8List.fromList([72, 101]);
        yield Uint8List.fromList([108, 108, 111]);
        reachedEnd = true;
        yield Uint8List.fromList([33]);
      }

      await expectLater(Body(chunks()).decode(utf8, maxBytes: 4), throwsStateError);
      expect(reachedEnd, isFalse);
    });
    test('decode counts UTF-8 bytes and handles split characters', () async {
      final body = Body(
        Stream.fromIterable([
          Uint8List.fromList([0xc3]),
          Uint8List.fromList([0xa9]),
        ]),
      );
      expect(await body.decode(utf8, maxBytes: 2), 'é');
      await expectLater(Body.text('é').decode(utf8, maxBytes: 1), throwsStateError);
    });
    test('zero byte limit accepts only empty bodies', () async {
      expect(await Body.empty().decode(utf8, maxBytes: 0), isEmpty);
      await expectLater(Body.text('x').decode(utf8, maxBytes: 0), throwsStateError);
    });
    for (final maxBytes in [-1, -2, -100]) {
      test('negative byte limit $maxBytes means unlimited', () async {
        expect(await Body.text('Hello').decode(utf8, maxBytes: maxBytes), 'Hello');
        expect(await Body.text('{"x":1}').decodeJson(maxBytes: maxBytes), {'x': 1});
      });
    }
    test('decodeJson enforces byte limits and preserves reviver behavior', () async {
      expect(
        await Body.text('{"x":1}')
            .decodeJson(maxBytes: 7, reviver: (key, value) => key == 'x' ? 2 : value),
        {'x': 2},
      );
      await expectLater(Body.text('{"x":1}').decodeJson(maxBytes: 6), throwsStateError);
    });
    test('decoding consumes a single-subscription body', () async {
      final body = Body.text('Hello');

      expect(await body.decode(utf8), 'Hello');
      await expectLater(() => body.decode(utf8), throwsStateError);
    });
    test('binary retains the supplied buffer', () async {
      final data = Uint8List.fromList(ascii.encode('Hello'));
      final body = Body.binary(data);
      data[0] = 74;

      expect(await body.decode(ascii), 'Jello');
    });
    test('binary can use an independent buffer copy', () async {
      final data = Uint8List.fromList(ascii.encode('Hello'));
      final body = Body.binary(Uint8List.fromList(data));
      data[0] = 74;

      expect(await body.decode(ascii), 'Hello');
    });
    test('empty body has empty stream', () async {
      expect(await Body.empty().bytes.isEmpty, isTrue);
      expect(await Body.text('').bytes.isEmpty, isTrue);
      expect(await Body.binary(Uint8List(0)).bytes.isEmpty, isTrue);
    });
  });
}
