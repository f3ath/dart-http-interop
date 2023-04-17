import 'dart:collection';

mixin Headers {
  /// Message headers. Case-insensitive.
  final headers = LinkedHashMap<String, String>(
      equals: (a, b) => a.toLowerCase() == b.toLowerCase(),
      hashCode: (s) => s.toLowerCase().hashCode);
}
