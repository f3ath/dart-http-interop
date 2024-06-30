import 'package:collection/collection.dart';

/// A collection of HTTP headers. The keys are case-insensitive.
/// The values MUST be treated by the implementations in the following way:
/// - empty lists or lists containing empty strings SHOULD NOT be present
///   in the headers and MUST be ignored
/// - if the field is a "singleton" (as per RFC 9110), its value MUST NOT
///   be split, i.e. it MUST be the first and only element of the list
/// - if the field is "list-based" (as per RFC 9110), its elements
///   MAY or MAY NOT be split into elements. They MAY also be partially
///   split e.g. ['foo', 'bar, baz']
/// - the "Set-Cookie" field values MUST be split one cookie per list element
final class Headers extends CanonicalizedMap<String, String, List<String>> {
  /// Creates a new empty instance.
  Headers() : super(_lowercase);

  /// Creates a new instance from the [source].
  Headers.from(Map<String, List<String>> source)
      : super.from(source, _lowercase);

  /// Creates a new instance from the [entries].
  Headers.fromEntries(Iterable<MapEntry<String, List<String>>> entries)
      : super.fromEntries(entries, _lowercase);

  static String _lowercase(String key) => key.toLowerCase();
}
