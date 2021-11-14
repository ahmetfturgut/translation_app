// import 'package:flutter/material.dart';
// import 'package:translation_app/core/init/translation.dart';

// class DropDownWidget extends StatelessWidget {
//   final String value;
//   final VoidCallback? onChangedLanguage;

//   const DropDownWidget({
//     required this.value,
//     this.onChangedLanguage,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final items = Translations.languages
//         .map<DropdownMenuItem<String>>(
//             (String value) => DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 ))
//         .toList();

//     return DropdownButton<String>(
//       value: value,
//       icon: Icon(Icons.expand_more, color: Colors.grey),
//       iconSize: 24,
//       elevation: 16,
//       style: TextStyle(color: Colors.black),
//       items: items,
//     );
//   }
// }
