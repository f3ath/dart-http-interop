import 'dart:convert';
import 'dart:typed_data';

/// An HTTP body backed by a stream of byte chunks.
///
/// The stream is retained without being consumed, buffered, or copied.
/// Reading the body follows the supplied stream's subscription rules; callers
/// must not assume that it can be read more than once. A broadcast stream does
/// not guarantee that later listeners receive previously emitted chunks.
///
/// Middleware that reads a body before forwarding it must provide a replacement
/// body containing the consumed bytes. Retries likewise require a fresh body
/// unless the supplied stream explicitly supports replay.
final class Body(
  /// The stream of byte chunks that make up the body.
  final Stream<Uint8List> bytes,
) {
  /// Creates a new empty body.
  new empty() : this(Stream.empty());

  /// Creates a new instance from [text] encoded with [encoding].
  new text(String text, {Encoding encoding = utf8})
    : this.binary(Uint8List.fromList(encoding.encode(text)));

  /// Creates a new instance from a single piece of binary [data].
  ///
  /// Retains [data] without copying it. Changes to the buffer before consumption
  /// are visible to the reader, so callers must not mutate it while in use.
  /// Pass `Uint8List.fromList(data)` to give the body an independent copy.
  new binary(Uint8List data) : this(data.isEmpty ? Stream.empty() : Stream.value(data));

  /// Creates a new instance by encoding [object] as UTF-8 JSON.
  ///
  /// Pass a custom [toEncodable] function to handle objects that cannot be
  /// encoded directly.
  new json(Object? object, {Object? Function(Object?)? toEncodable})
    : this.text(jsonEncode(object, toEncodable: toEncodable), encoding: utf8);
}
