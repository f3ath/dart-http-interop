library;

import 'dart:convert';

import 'package:http_interop/src/body.dart';

/// Decoding operations for HTTP bodies.
extension BodyExt on Body {
  /// Decodes the body using the given [encoding].
  ///
  /// Consumes the byte stream and buffers the decoded text in memory. Reading
  /// the body again requires a stream that supports replay.
  ///
  /// The [maxBytes] limit counts bytes before decoding. Any negative value,
  /// including the default of `-1`, disables the limit.
  ///
  /// Throws a [StateError] and stops consuming the stream if the body exceeds
  /// [maxBytes].
  Future<String> decode(Encoding encoding, {int maxBytes = -1}) =>
      encoding.decodeStream(maxBytes < 0 ? bytes : _limitBytes(bytes, maxBytes));

  /// Decodes the UTF-8 body into a JSON value.
  ///
  /// Uses [decode] to consume the byte stream and buffer the decoded text in
  /// memory before parsing it with [jsonDecode]. The optional [reviver] is
  /// passed to [jsonDecode]. Reading the body again requires a stream that
  /// supports replay.
  ///
  /// The [maxBytes] limit counts UTF-8 bytes and follows the same rules as
  /// [decode].
  Future<dynamic> decodeJson({
    Object? Function(Object? key, Object? value)? reviver,
    int maxBytes = -1,
  }) async => jsonDecode(await decode(utf8, maxBytes: maxBytes), reviver: reviver);
}

Stream<List<int>> _limitBytes(Stream<List<int>> bytes, int maxBytes) async* {
  var remaining = maxBytes;
  await for (final chunk in bytes) {
    if (chunk.length > remaining) {
      throw StateError('Body exceeds the maximum size of $maxBytes bytes');
    }
    remaining -= chunk.length;
    yield chunk;
  }
}
