import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';

/// Convert a String to a ConnectivityResult value.
ConnectivityResult parseConnectivityResult(String state) {
  switch (state) {
    case 'wifi':
      return ConnectivityResult.wifi;
    case 'mobile':
      return ConnectivityResult.mobile;
    case 'none':
    default:
      return ConnectivityResult.none;
  }
}

/// Convert a Map to a ProxyResult value.
ProxyResult parseProxyResult(Map<dynamic, dynamic> proxySettingsMap) {
  final proxySettings = Map<String, dynamic>.from(proxySettingsMap);
  String? host;
  String? port;
  // iOS
  if (proxySettings.containsKey('HTTPEnable') &&
      proxySettings['HTTPEnable'] == 1) {
    if (proxySettings.containsKey('port')) {
      port = proxySettings['HTTPPort'].toString();
    }
    if (proxySettings.containsKey('host')) {
      host = proxySettings['HTTPProxy'].toString();
    }
  } else {
    // Android
    if (proxySettings.containsKey('port')) {
      port = proxySettings['port'].toString();
    }
    if (proxySettings.containsKey('host')) {
      host = proxySettings['host'].toString();
    }
  }
  return ProxyResult(host: host, port: port);
}
