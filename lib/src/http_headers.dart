import 'dart:convert';

import 'package:http_parser/http_parser.dart';

class HttpHeaders extends CaseInsensitiveMap<String> {
  HttpHeaders(Map<String, String> headers) : super.from(headers);

  /// Returns the [Encoding] object for this headers.
  /// Defaults to [latin1].
  Encoding get encoding =>
      Encoding.getByName(mediaType.parameters['charset']) ?? latin1;

  /// Returns the [MediaType] object for this headers.
  /// Defaults to `application/octet-stream`.
  MediaType get mediaType {
    final contentType = this['content-type'];
    if (contentType != null) return MediaType.parse(contentType);
    return MediaType('application', 'octet-stream');
  }
}
