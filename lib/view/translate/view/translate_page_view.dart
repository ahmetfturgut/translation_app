import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:translation_app/core/base/view/base_widget.dart';
import 'package:translation_app/core/components/button.dart';
import 'package:translation_app/core/components/dropdown.dart';

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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
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
                  buildTextForm(viewModel),
                  const SizedBox(
                    height: 15,
                  ),
                  buildTranslateButton(viewModel),
                  const SizedBox(
                    height: 15,
                  ),
                  buildTranslateText(context, viewModel)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Observer buildTranslateText(context, TranslatePageViewModel viewModel) {
    return Observer(builder: (_) {
      return Card(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(44.0),
          child: Center(
            child: Text(
              viewModel.translateWord,
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ),
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

  Card buildTextForm(viewModel) {
    return Card(
      child: Form(
        key: viewModel.formState,
        child: TextFormField(
            textAlign: TextAlign.center,
            maxLines: 5,
            controller: viewModel.translateTextController,
            decoration: const InputDecoration(
              hintText: "Metin Girmek için Dokunun",
              fillColor: Colors.white,
              border: InputBorder.none,
            )),
      ),
    );
  }

  Expanded buildConvertedLanguage(TranslatePageViewModel viewModel) {
    return Expanded(
      child: Observer(builder: (_) {
        return DropDownWidget(
            value: viewModel.convertedLang,
            onChangedLanguage: (select) {
              viewModel.convertedLangChange(select);
            });
      }),
    );
  }

  Expanded buildSelectedLanguage(TranslatePageViewModel viewModel) {
    return Expanded(
      child: Observer(builder: (_) {
        return DropDownWidget(
            value: viewModel.selectedLang,
            onChangedLanguage: (select) {
              viewModel.selectedLangChange(select);
            });
      }),
    );
  }
}
