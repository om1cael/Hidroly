import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'translation_provider.g.dart';

@riverpod
TranslationProvider translationProvider(Ref ref) {
  return TranslationProvider();
}

class TranslationProvider {
  String translate(String text) => tr(text);
}