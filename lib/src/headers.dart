import 'package:http_parser/http_parser.dart';

/// A collection of HTTP headers. The keys are case-insensitive.
class Headers extends CaseInsensitiveMap<List<String>> {
  /// Creates a new empty instance.
  Headers();

  /// Creates a new instance from a map.
  Headers.from(Map<String, List<String>> headers) : super.from(headers);
}
