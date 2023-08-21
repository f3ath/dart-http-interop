import 'dart:convert';

import 'package:http_interop/src/body.dart';

extension BodyExt on Body {
  /// Decodes [body] using the given [encoding].
  Future<String> decode(Encoding encoding) => encoding.decodeStream(bytes);
}
