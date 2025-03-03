
import 'package:fonnx_example/models/llm_config.dart';
import 'package:fonnx_example/models/proxy_config.dart';

class AppSettings {
  ProxyConfig proxyConfig;
  LLMConfig llmConfig;

  AppSettings(
    this.proxyConfig,
    this.llmConfig
  );
}
