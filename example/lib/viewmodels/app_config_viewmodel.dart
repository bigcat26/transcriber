import 'package:flutter/material.dart';
import '../models/app_config.dart';
import '../models/llm_config.dart';
import '../models/proxy_config.dart';

class AppConfigViewModel with ChangeNotifier {
  AppConfig _AppConfig;

  AppConfigViewModel(this._AppConfig);

  // 获取代理配置
  ProxyConfig get proxyConfig => _AppConfig.proxyConfig;

  // 设置代理配置
  set proxyConfig(ProxyConfig value) {
    _AppConfig.proxyConfig = value;
    notifyListeners();
  }

  // 获取LLM配置
  LLMConfig get llmConfig => _AppConfig.llmConfig;

  // 设置LLM配置
  set llmConfig(LLMConfig value) {
    _AppConfig.llmConfig = value;
    notifyListeners();
  }

  // 更新AppConfig
  void updateSettings(AppConfig newSettings) {
    _AppConfig = newSettings;
    notifyListeners();
  }
}