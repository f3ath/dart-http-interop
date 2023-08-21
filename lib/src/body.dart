import 'dart:convert';
import 'dart:typed_data';

class Body {
  Body(String text, Encoding encoding)
      : this.binary(Uint8List.fromList(encoding.encode(text)));

  Body.binary(Uint8List bytes) : this.stream(Stream.value(bytes));

  Body.stream(this.bytes);

  static final empty = Body.binary(Uint8List(0));

  Stream<Uint8List> bytes;
}
