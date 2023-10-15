import 'dart:convert';

import 'package:http_interop/src/body.dart';
import 'package:http_interop/src/headers.dart';
import 'package:quoted_string/quoted_string.dart';

extension HeadersExt on Headers {
  /// Combines multiple headers with the same name into a single string
  /// of comma-separated values.
  Map<String, String> combine() => map((key, values) => MapEntry(
      key, values.map((it) => it._isHeaderSafe ? it : it.quote()).join(',')));
}

extension BodyExt on Body {
  /// Decodes the body using the given [encoding].
  Future<String> decode(Encoding encoding) => encoding.decodeStream(bytes);

  /// Decodes the body into a JSON object.
  Future<dynamic> decodeJson() async => jsonDecode(await decode(utf8));
}

extension StringExt on String {
  /// True if the string is safe to use as a header value.
  bool get _isHeaderSafe => isNotEmpty && !contains(',') && trim() == this;
}
