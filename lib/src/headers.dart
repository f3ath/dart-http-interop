import 'package:http_parser/http_parser.dart';

/// HTTP headers is nothing but a case-insensitive map
class Headers extends CaseInsensitiveMap<List<String>> {
  Headers(Map<String, List<String>> headers) : super.from(headers);
}
