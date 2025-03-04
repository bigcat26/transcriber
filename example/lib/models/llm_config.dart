import 'package:json_annotation/json_annotation.dart';

part 'llm_config.g.dart';

@JsonSerializable()
class LLMConfig {

  final String baseUrl;
  final String apiKey;
  final String model;

  LLMConfig(this.baseUrl, this.apiKey, {this.model = ""});

  factory LLMConfig.fromJson(Map<String, dynamic> json) => _$LLMConfigFromJson(json);
  Map<String, dynamic> toJson() => _$LLMConfigToJson(this);
}
