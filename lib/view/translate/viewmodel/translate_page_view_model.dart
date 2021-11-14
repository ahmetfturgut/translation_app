import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:translation_app/core/base/model/base_view_model.dart';
import 'package:translation_app/core/init/translation.dart';
import 'package:translation_app/view/translate/service/translate_page_service.dart';
part 'translate_page_view_model.g.dart';

class TranslatePageViewModel = _TranslatePageViewModelBase
    with _$TranslatePageViewModel;

abstract class _TranslatePageViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  late LoginService loginService;
  @override
  void setContext(BuildContext context) => this.context = context;
  TextEditingController? translateTextController;
  @observable
  List<String> langs = Translations.languages;
  @observable
  String selectedLang = "Türkçe";
  @observable
  String convertedLang = "English";

  @action
  void selectedLangChange(selected) {
    selectedLang = selected;
  }

  @action
  void convertedLangChange(selected) {
    convertedLang = selected;
  }

  @action
  Future<dynamic> translate() async {
    var word = translateTextController!.text;
    var detectedSourceLanguage = await LoginService.detectLanguage(word);

    selectedLang = Translations.getLanguageName(detectedSourceLanguage);
  }

  @override
  void init() {
    translateTextController = TextEditingController();
    loginService = LoginService();
  }
}
