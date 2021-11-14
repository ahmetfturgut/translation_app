// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TranslatePageViewModel on _TranslatePageViewModelBase, Store {
  final _$langsAtom = Atom(name: '_TranslatePageViewModelBase.langs');

  @override
  List<String> get langs {
    _$langsAtom.reportRead();
    return super.langs;
  }

  @override
  set langs(List<String> value) {
    _$langsAtom.reportWrite(value, super.langs, () {
      super.langs = value;
    });
  }

  final _$selectedLangAtom =
      Atom(name: '_TranslatePageViewModelBase.selectedLang');

  @override
  String get selectedLang {
    _$selectedLangAtom.reportRead();
    return super.selectedLang;
  }

  @override
  set selectedLang(String value) {
    _$selectedLangAtom.reportWrite(value, super.selectedLang, () {
      super.selectedLang = value;
    });
  }

  final _$convertedLangAtom =
      Atom(name: '_TranslatePageViewModelBase.convertedLang');

  @override
  String get convertedLang {
    _$convertedLangAtom.reportRead();
    return super.convertedLang;
  }

  @override
  set convertedLang(String value) {
    _$convertedLangAtom.reportWrite(value, super.convertedLang, () {
      super.convertedLang = value;
    });
  }

  final _$translateWordAtom =
      Atom(name: '_TranslatePageViewModelBase.translateWord');

  @override
  String get translateWord {
    _$translateWordAtom.reportRead();
    return super.translateWord;
  }

  @override
  set translateWord(String value) {
    _$translateWordAtom.reportWrite(value, super.translateWord, () {
      super.translateWord = value;
    });
  }

  final _$detectLanguageAsyncAction =
      AsyncAction('_TranslatePageViewModelBase.detectLanguage');

  @override
  Future<dynamic> detectLanguage() {
    return _$detectLanguageAsyncAction.run(() => super.detectLanguage());
  }

  final _$translateAsyncAction =
      AsyncAction('_TranslatePageViewModelBase.translate');

  @override
  Future<dynamic> translate(
      String word, String fromLanguageCode, String toLanguageCode) {
    return _$translateAsyncAction
        .run(() => super.translate(word, fromLanguageCode, toLanguageCode));
  }

  final _$_TranslatePageViewModelBaseActionController =
      ActionController(name: '_TranslatePageViewModelBase');

  @override
  void selectedLangChange(dynamic selected) {
    final _$actionInfo = _$_TranslatePageViewModelBaseActionController
        .startAction(name: '_TranslatePageViewModelBase.selectedLangChange');
    try {
      return super.selectedLangChange(selected);
    } finally {
      _$_TranslatePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void convertedLangChange(dynamic selected) {
    final _$actionInfo = _$_TranslatePageViewModelBaseActionController
        .startAction(name: '_TranslatePageViewModelBase.convertedLangChange');
    try {
      return super.convertedLangChange(selected);
    } finally {
      _$_TranslatePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
langs: ${langs},
selectedLang: ${selectedLang},
convertedLang: ${convertedLang},
translateWord: ${translateWord}
    ''';
  }
}
