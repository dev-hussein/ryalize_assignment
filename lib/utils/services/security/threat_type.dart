
/// A class which holds state about threat.
class ThreatType {
  /// Threat constructor.
  ThreatType(this._text);

  final String _text;
  bool _isSecure = true;

  /// Update state.
  void threatFound() => _isSecure = false;

  /// Return current state.
  String get state => '$_text: ${_isSecure ? "Secured" : "Detected"}\n';
}