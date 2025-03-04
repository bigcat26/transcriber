import 'package:json_annotation/json_annotation.dart';
import 'package:fonnx_example/models/llm_config.dart';
import 'package:fonnx_example/models/proxy_config.dart';

// dart run build_runner build
part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  ProxyConfig proxyConfig;
  LLMConfig llmConfig;

  AppConfig(
    this.proxyConfig,
    this.llmConfig
  );

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
