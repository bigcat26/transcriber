

class ProxyConfig {
  final bool proxyEnabled;
  final String proxyServer;
  final String proxyUser;
  final String proxyPassword;

  ProxyConfig({
    this.proxyEnabled = false,
    this.proxyServer = "",
    this.proxyUser = "",
    this.proxyPassword = "",
  });
}
