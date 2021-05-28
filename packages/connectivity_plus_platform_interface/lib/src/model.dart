/// Get Proxy result
class ProxyResult {
  /// The host that is set in device proxy settings
  final String? host;

  /// The port that is set in device proxy settings
  final String? port;

  /// Proxy result
  ProxyResult({
    required this.host,
    required this.port,
  });
}
