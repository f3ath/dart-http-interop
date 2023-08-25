import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Headers', () {
    test('are case-insensitive', () {
      final headers = Headers({'Accept': ['text/plain']});
      expect(headers['Accept']?.first, equals('text/plain'));
      expect(headers['accept']?.first, equals('text/plain'));
      expect(headers['AcCePt']?.first, equals('text/plain'));
    });
  });
}
