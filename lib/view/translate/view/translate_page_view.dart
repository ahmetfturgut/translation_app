import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:translation_app/core/base/view/base_widget.dart';
import 'package:translation_app/core/components/button.dart';

import 'package:translation_app/view/translate/viewmodel/translate_page_view_model.dart';

class TranslatePage extends StatelessWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TranslatePageViewModel>(
      viewModel: TranslatePageViewModel(),
      onModelReady: (model) {
        model.init();
      },
      onPageBuilder: (BuildContext context, TranslatePageViewModel viewModel) =>
          Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildSelectedLanguage(viewModel),
                            const SizedBox(
                              width: 80,
                              child: Icon(Icons.translate),
                            ),
                            buildConvertedLanguage(viewModel),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextForm(viewModel),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            buildTranslateButton(viewModel)
                          ],
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        buildTranslateText(viewModel)
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Observer buildTranslateText(TranslatePageViewModel viewModel) {
    return Observer(builder: (_) {
      return Text(
        viewModel.translateWord,
        style: const TextStyle(fontSize: 22),
      );
    });
  }

  NormalButton buildTranslateButton(viewModel) {
    return NormalButton(
      child: const Text("Çevir"),
      onPressed: () {
        viewModel.detectLanguage();
      },
    );
  }

  Form buildTextForm(viewModel) {
    return Form(
      key: viewModel.formState,
      child: TextFormField(
          controller: viewModel.translateTextController,
          decoration: const InputDecoration(
            hintText: "Metin Girmek için Dokunun",
            fillColor: Colors.white,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.only(top: 15),
          )),
    );
  }

  Expanded buildConvertedLanguage(TranslatePageViewModel viewModel) {
    return Expanded(
      child: Observer(builder: (_) {
        return DropdownButton<String>(
          value: viewModel.convertedLang,
          items: viewModel.langs.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (select) {
            viewModel.convertedLangChange(select);
          },
        );
      }),
    );
  }

  Expanded buildSelectedLanguage(TranslatePageViewModel viewModel) {
    return Expanded(
      child: Observer(builder: (_) {
        return DropdownButton<String>(
          value: viewModel.selectedLang,
          items: viewModel.langs.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (select) {
            viewModel.selectedLangChange(select);
          },
        );
      }),
    );
  }
}
