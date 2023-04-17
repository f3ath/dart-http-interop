import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Headers', () {
    test('are case-insensitive', () {
      final msg = Message('');
      msg.headers['Accept'] = 'text/plain';
      expect(msg.headers['Accept'], equals('text/plain'));
      expect(msg.headers['accept'], equals('text/plain'));
      expect(msg.headers['AcCePt'], equals('text/plain'));
    });
  });
}
