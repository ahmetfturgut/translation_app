import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:translation_app/core/init/translation.dart';
import 'package:translation_app/view/translate/service/translate_page_service.dart';
part 'translate_page_view_model.g.dart';

class TranslatePageViewModel = _TranslatePageViewModelBase
    with _$TranslatePageViewModel;

abstract class _TranslatePageViewModelBase with Store {
  GlobalKey<FormState> formState = GlobalKey();
  late TranslateSErvice loginService;
  TextEditingController? translateTextController;
  @observable
  List<String> langs = Translations.languages;
  @observable
  String selectedLang = "Türkçe";
  @observable
  String convertedLang = "English";

  @observable
  String translateWord = "";

  @action
  void selectedLangChange(selected) {
    selectedLang = selected;
  }

  @action
  void convertedLangChange(selected) {
    convertedLang = selected;
  }

  @action
  Future<dynamic> detectLanguage() async {
    var word = translateTextController!.text;
    var detectedSourceLanguage = await TranslateSErvice.detectLanguage(word);

    selectedLang = Translations.getLanguageName(detectedSourceLanguage);

    translateWord = await TranslateSErvice.translate(word,
        detectedSourceLanguage, Translations.getLanguageCode(convertedLang));
  }

  @action
  Future<dynamic> translate(
      String word, String fromLanguageCode, String toLanguageCode) async {
    translateWord = await TranslateSErvice.translate(
        word, fromLanguageCode, toLanguageCode);
  }

  void init() {
    translateTextController = TextEditingController();
    loginService = TranslateSErvice();
  }
}
