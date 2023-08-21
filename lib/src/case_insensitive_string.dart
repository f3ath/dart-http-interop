class CaseInsensitiveString {
  CaseInsensitiveString(this.value) : _lc = value.toLowerCase();

  /// String value.
  final String value;

  /// String value, lowercase.
  final String _lc;

  /// True if [other] represents the same value.
  bool equals(String other) => this == CaseInsensitiveString(other);

  @override
  bool operator ==(Object other) =>
      other is CaseInsensitiveString && _lc == other._lc;

  @override
  String toString() => value;

  @override
  int get hashCode => 0;
}
