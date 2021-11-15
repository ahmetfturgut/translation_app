import 'package:flutter/material.dart';
import 'package:translation_app/core/init/translation.dart';

class DropDownWidget extends StatelessWidget {
  final String value;
  final onChangedLanguage;

  const DropDownWidget({
    required this.value,
    this.onChangedLanguage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: Translations.languages.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChangedLanguage,
    );
  }
}
