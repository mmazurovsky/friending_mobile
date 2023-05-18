import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  const LanguageModel._();
  const factory LanguageModel({
    required String name,
    required String emojiCode,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}
