import 'package:http_interop/src/case_insensitive_string.dart';

class Method extends CaseInsensitiveString {
  Method(String value) : super(value.trim()) {
    if (value.isEmpty) throw ArgumentError('Method name cannot be empty');
  }
}
