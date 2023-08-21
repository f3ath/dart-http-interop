import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Headers', () {
    test('are case-insensitive', () {
      final headers = Headers({'Accept': 'text/plain'});
      expect(headers['Accept'], equals('text/plain'));
      expect(headers['accept'], equals('text/plain'));
      expect(headers['AcCePt'], equals('text/plain'));
    });
  });
}
