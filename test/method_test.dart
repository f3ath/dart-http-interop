import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Method', () {
    test('can not be empty', () {
      expect(() => Method(''), throwsArgumentError);
    });
  });
}
