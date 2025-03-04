import 'package:json_annotation/json_annotation.dart';

part 'proxy_config.g.dart';

@JsonSerializable()
class ProxyConfig {
  final bool proxyEnabled;
  final String proxyServer;
  final String proxyUser;
  final String proxyPassword;

  ProxyConfig([
    this.proxyEnabled = false,
    this.proxyServer = "",
    this.proxyUser = "",
    this.proxyPassword = "",
  ]);

  factory ProxyConfig.fromJson(Map<String, dynamic> json) => _$ProxyConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ProxyConfigToJson(this);
}
