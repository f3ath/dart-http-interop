import 'dart:convert';
import 'dart:typed_data';

/// HTTP Body.
/// Essentially it is just a `Stream<Uint8List>` with a few
/// useful constructors.
class Body {
  /// Create a new instance from [text] encoded with [encoding].
  Body(String text, Encoding encoding)
      : this.binary(Uint8List.fromList(encoding.encode(text)));

  /// Create a new instance from a single piece of binary [data]..
  Body.binary(Uint8List data) : this.stream(Stream.value(data));

  /// Creates a new instance from a binary stream.
  Body.stream(this.bytes);

  /// Creates a new empty instance.
  Body.empty() : this.binary(Uint8List(0));

  /// Request body as a binary stream.
  final Stream<Uint8List> bytes;
}
