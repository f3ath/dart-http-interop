import 'package:http_parser/http_parser.dart';

class Headers extends CaseInsensitiveMap<String> {
  Headers(Map<String, String> headers) : super.from(headers);
}
