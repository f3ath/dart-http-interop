import 'dart:typed_data';

import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('HttpRequest', () {
    test('body is set', () {
      final r = HttpRequest('get', Uri(), body: 'foo');
      expect(r.body, equals('foo'));
    });
    test('binary body is set', () {
      final bodyBytes = Uint8List.fromList([0, 1, 2, 3, 254, 255]);
      final r = HttpRequest.binary('get', Uri(), bodyBytes);
      expect(r.bodyBytes, equals(bodyBytes));
    });
    test('isGet', () {
      expect(HttpRequest('get', Uri()).isGet, isTrue);
      expect(HttpRequest('GET', Uri()).isGet, isTrue);
      expect(HttpRequest('post', Uri()).isGet, isFalse);
      expect(HttpRequest('POST', Uri()).isGet, isFalse);
      expect(HttpRequest('delete', Uri()).isGet, isFalse);
      expect(HttpRequest('DELETE', Uri()).isGet, isFalse);
      expect(HttpRequest('patch', Uri()).isGet, isFalse);
      expect(HttpRequest('PATCH', Uri()).isGet, isFalse);
      expect(HttpRequest('options', Uri()).isGet, isFalse);
      expect(HttpRequest('OPTIONS', Uri()).isGet, isFalse);
    });
    test('isPost', () {
      expect(HttpRequest('get', Uri()).isPost, isFalse);
      expect(HttpRequest('GET', Uri()).isPost, isFalse);
      expect(HttpRequest('post', Uri()).isPost, isTrue);
      expect(HttpRequest('POST', Uri()).isPost, isTrue);
      expect(HttpRequest('delete', Uri()).isPost, isFalse);
      expect(HttpRequest('DELETE', Uri()).isPost, isFalse);
      expect(HttpRequest('patch', Uri()).isPost, isFalse);
      expect(HttpRequest('PATCH', Uri()).isPost, isFalse);
      expect(HttpRequest('options', Uri()).isPost, isFalse);
      expect(HttpRequest('OPTIONS', Uri()).isPost, isFalse);
    });
    test('isDelete', () {
      expect(HttpRequest('get', Uri()).isDelete, isFalse);
      expect(HttpRequest('GET', Uri()).isDelete, isFalse);
      expect(HttpRequest('post', Uri()).isDelete, isFalse);
      expect(HttpRequest('POST', Uri()).isDelete, isFalse);
      expect(HttpRequest('delete', Uri()).isDelete, isTrue);
      expect(HttpRequest('DELETE', Uri()).isDelete, isTrue);
      expect(HttpRequest('patch', Uri()).isDelete, isFalse);
      expect(HttpRequest('PATCH', Uri()).isDelete, isFalse);
      expect(HttpRequest('options', Uri()).isDelete, isFalse);
      expect(HttpRequest('OPTIONS', Uri()).isDelete, isFalse);
    });
    test('isPatch', () {
      expect(HttpRequest('get', Uri()).isPatch, isFalse);
      expect(HttpRequest('GET', Uri()).isPatch, isFalse);
      expect(HttpRequest('post', Uri()).isPatch, isFalse);
      expect(HttpRequest('POST', Uri()).isPatch, isFalse);
      expect(HttpRequest('delete', Uri()).isPatch, isFalse);
      expect(HttpRequest('DELETE', Uri()).isPatch, isFalse);
      expect(HttpRequest('patch', Uri()).isPatch, isTrue);
      expect(HttpRequest('PATCH', Uri()).isPatch, isTrue);
      expect(HttpRequest('options', Uri()).isPatch, isFalse);
      expect(HttpRequest('OPTIONS', Uri()).isPatch, isFalse);
    });
    test('isOptions', () {
      expect(HttpRequest('get', Uri()).isOptions, isFalse);
      expect(HttpRequest('GET', Uri()).isOptions, isFalse);
      expect(HttpRequest('post', Uri()).isOptions, isFalse);
      expect(HttpRequest('POST', Uri()).isOptions, isFalse);
      expect(HttpRequest('delete', Uri()).isOptions, isFalse);
      expect(HttpRequest('DELETE', Uri()).isOptions, isFalse);
      expect(HttpRequest('patch', Uri()).isOptions, isFalse);
      expect(HttpRequest('PATCH', Uri()).isOptions, isFalse);
      expect(HttpRequest('options', Uri()).isOptions, isTrue);
      expect(HttpRequest('OPTIONS', Uri()).isOptions, isTrue);
    });
  });
}
