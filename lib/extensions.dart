library extentions;

import 'dart:convert';

import 'package:http_interop/src/body.dart';

extension BodyExt on Body {
  /// Decodes the body using the given [encoding].
  Future<String> decode(Encoding encoding) => encoding.decodeStream(bytes);

  /// Decodes the body into a JSON object.
  Future<dynamic> decodeJson() async => jsonDecode(await decode(utf8));
}
