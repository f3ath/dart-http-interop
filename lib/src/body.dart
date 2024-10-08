import 'dart:convert';
import 'dart:typed_data';

/// HTTP Body is just a `Stream<Uint8List>` with a few
/// useful constructors.
final class Body {
  /// Creates a new empty body.
  Body() : bytes = Stream.empty();

  /// Create a new instance from [text] encoded with [encoding].
  Body.text(String text, Encoding encoding)
      : this.binary(Uint8List.fromList(encoding.encode(text)));

  /// Create a new instance from a single piece of binary [data]..
  Body.binary(Uint8List data)
      : bytes = data.isEmpty ? Stream.empty() : Stream.value(data);

  /// Creates a new instance from a binary stream.
  Body.stream(this.bytes);

  /// Creates a new instance by encoding the [object] into JSON.
  /// This method always uses UTF-8 encoding.
  /// Pass a custom [toEncodable] function to handle non-encodable objects.
  Body.json(Object? object,
      {Object? Function(Object? nonEncodable)? toEncodable})
      : this.text(jsonEncode(object, toEncodable: toEncodable), utf8);

  /// Request body as a binary stream.
  final Stream<Uint8List> bytes;
}
