import 'dart:convert';

import 'package:http_interop/src/body.dart';
import 'package:http_interop/src/headers.dart';

extension HeadersExt on Headers {
  /// Combines multiple headers with the same name into a single string
  /// of comma-separated values.
  Map<String, String> combine() => map((key, values) => MapEntry(
      key, values.map((it) => it.isHeaderSafe ? it : it.quoted).join(',')));
}

extension BodyExt on Body {
  /// Decodes the body using the given [encoding].
  Future<String> decode(Encoding encoding) => encoding.decodeStream(bytes);

  /// Decodes the body into a JSON object.
  Future<dynamic> decodeJson() async => jsonDecode(await decode(utf8));
}

extension StringExt on String {
  /// The string quoted and escaped according to the multiheader escaping rules.
  String get quoted => '"${replaceAll(r'\', r'\\').replaceAll('"', r'\"')}"';

  /// True if the string is safe to use as a header value.
  bool get isHeaderSafe => isNotEmpty && !contains(',') && trim() == this;
}
