import 'dart:convert';

import 'package:http_interop/extensions.dart';
import 'package:http_interop/http_interop.dart';
import 'package:test/test.dart';

void main() {
  group('Body', () {
    test('decode', () async {
      expect(await Body('привет', utf8).decode(utf8), equals('привет'));
    });
  });
}
