import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_config.dart';
import '../models/llm_config.dart';
import '../models/proxy_config.dart';

class ConfigService {


  Future<void> saveConfig(AppConfig config) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(_proxyConfigKey, proxyConfig);
  }

  Future<AppConfig> loadConfig() async {
    // final prefs = await SharedPreferences.getInstance();
    // return prefs.getString(_proxyConfigKey);
    return AppConfig(ProxyConfig(true, "http://127.0.0.1:38080"), LLMConfig("", ""));
  }

}