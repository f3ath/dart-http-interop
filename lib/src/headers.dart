import 'package:collection/collection.dart';

/// A collection of HTTP headers. The keys are case-insensitive.
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
