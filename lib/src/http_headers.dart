import 'dart:convert';

import 'package:http_parser/http_parser.dart';

class HttpHeaders extends CaseInsensitiveMap<String> {
  HttpHeaders(
    Map<String, String> headers,
  ) : super.from(headers);

  /// Returns the [Encoding] object for this headers.
  Encoding? get encoding {
    final mt = mediaType;
    if (mt != null) return Encoding.getByName(mt.parameters['charset']);
    return null;
  }

  /// Returns the [MediaType] object for this headers.
  MediaType? get mediaType {
    final contentType = this['content-type'];
    if (contentType != null) return MediaType.parse(contentType);
    return null;
  }
}
