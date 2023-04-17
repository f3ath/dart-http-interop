import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Request', () {
    test('isGet', () {
      expect(Request('get', Uri()).isGet, isTrue);
      expect(Request('GET', Uri()).isGet, isTrue);
      expect(Request('post', Uri()).isGet, isFalse);
      expect(Request('POST', Uri()).isGet, isFalse);
      expect(Request('delete', Uri()).isGet, isFalse);
      expect(Request('DELETE', Uri()).isGet, isFalse);
      expect(Request('patch', Uri()).isGet, isFalse);
      expect(Request('PATCH', Uri()).isGet, isFalse);
      expect(Request('options', Uri()).isGet, isFalse);
      expect(Request('OPTIONS', Uri()).isGet, isFalse);
    });
    test('isPost', () {
      expect(Request('get', Uri()).isPost, isFalse);
      expect(Request('GET', Uri()).isPost, isFalse);
      expect(Request('post', Uri()).isPost, isTrue);
      expect(Request('POST', Uri()).isPost, isTrue);
      expect(Request('delete', Uri()).isPost, isFalse);
      expect(Request('DELETE', Uri()).isPost, isFalse);
      expect(Request('patch', Uri()).isPost, isFalse);
      expect(Request('PATCH', Uri()).isPost, isFalse);
      expect(Request('options', Uri()).isPost, isFalse);
      expect(Request('OPTIONS', Uri()).isPost, isFalse);
    });
    test('isDelete', () {
      expect(Request('get', Uri()).isDelete, isFalse);
      expect(Request('GET', Uri()).isDelete, isFalse);
      expect(Request('post', Uri()).isDelete, isFalse);
      expect(Request('POST', Uri()).isDelete, isFalse);
      expect(Request('delete', Uri()).isDelete, isTrue);
      expect(Request('DELETE', Uri()).isDelete, isTrue);
      expect(Request('patch', Uri()).isDelete, isFalse);
      expect(Request('PATCH', Uri()).isDelete, isFalse);
      expect(Request('options', Uri()).isDelete, isFalse);
      expect(Request('OPTIONS', Uri()).isDelete, isFalse);
    });
    test('isPatch', () {
      expect(Request('get', Uri()).isPatch, isFalse);
      expect(Request('GET', Uri()).isPatch, isFalse);
      expect(Request('post', Uri()).isPatch, isFalse);
      expect(Request('POST', Uri()).isPatch, isFalse);
      expect(Request('delete', Uri()).isPatch, isFalse);
      expect(Request('DELETE', Uri()).isPatch, isFalse);
      expect(Request('patch', Uri()).isPatch, isTrue);
      expect(Request('PATCH', Uri()).isPatch, isTrue);
      expect(Request('options', Uri()).isPatch, isFalse);
      expect(Request('OPTIONS', Uri()).isPatch, isFalse);
    });
    test('isOptions', () {
      expect(Request('get', Uri()).isOptions, isFalse);
      expect(Request('GET', Uri()).isOptions, isFalse);
      expect(Request('post', Uri()).isOptions, isFalse);
      expect(Request('POST', Uri()).isOptions, isFalse);
      expect(Request('delete', Uri()).isOptions, isFalse);
      expect(Request('DELETE', Uri()).isOptions, isFalse);
      expect(Request('patch', Uri()).isOptions, isFalse);
      expect(Request('PATCH', Uri()).isOptions, isFalse);
      expect(Request('options', Uri()).isOptions, isTrue);
      expect(Request('OPTIONS', Uri()).isOptions, isTrue);
    });
  });
}
