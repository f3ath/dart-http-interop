import 'package:collection/collection.dart';

/// A collection of HTTP headers with case-insensitive keys.
///
/// Implementations MUST handle values as follows:
///
/// - Empty lists represent no field values and MUST be ignored when sending
///   headers.
/// - Empty strings represent present, empty field values and MUST be preserved,
///   including in lists with nonempty values. Whether an empty value is valid
///   depends on the field's grammar.
/// - A singleton field (as defined in RFC 9110) MUST NOT be split. Its value
///   MUST be the only element in the list.
/// - A list-based field (as defined in RFC 9110) MAY be split into list elements,
///   left unsplit, or partially split, for example, `['foo', 'bar, baz']`.
/// - Each `Set-Cookie` field value MUST occupy a separate list element.
final class Headers extends CanonicalizedMap<String, String, List<String>> {
  /// Creates a new empty instance.
  new() : super(_lowercase);

  /// Creates a new instance from [source].
  new from(Map<String, List<String>> source) : super.from(source, _lowercase);

  /// Creates a new instance from [entries].
  new fromEntries(Iterable<MapEntry<String, List<String>>> entries)
    : super.fromEntries(entries, _lowercase);

  static String _lowercase(String key) => key.toLowerCase();
}
