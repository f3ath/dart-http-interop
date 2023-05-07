import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('HttpHeaders', () {
    test('are case-insensitive', () {
      final headers = HttpHeaders({'Accept': 'text/plain'});
      expect(headers['Accept'], equals('text/plain'));
      expect(headers['accept'], equals('text/plain'));
      expect(headers['AcCePt'], equals('text/plain'));
    });
  });
}
