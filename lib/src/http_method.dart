final class HttpMethod {
  HttpMethod(String name) : name = name.trim().toUpperCase() {
    if (name.isEmpty) throw ArgumentError('Method name cannot be empty');
  }

  /// Method name, uppercase.
  final String name;

  /// True if [other] represents the same method.
  bool equals(String other) => this == HttpMethod(other);

  @override
  bool operator ==(Object other) => other is HttpMethod && name == other.name;

  @override
  String toString() => name;

  @override
  int get hashCode => name.hashCode;
}
