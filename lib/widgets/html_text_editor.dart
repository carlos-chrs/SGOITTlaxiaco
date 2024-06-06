// import 'package:flutter/material.dart';
// import 'package:html_editor_enhanced/html_editor.dart';

// class HtmlTextEditor extends StatelessWidget {
//   final HtmlEditorController controller;
//   final double alto;
//   const HtmlTextEditor({
//     required this.alto,
//     required this.controller,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return HtmlEditor(
//       htmlToolbarOptions: const HtmlToolbarOptions(
//           toolbarPosition: ToolbarPosition.belowEditor,
//           defaultToolbarButtons: [
//             FontButtons(clearAll: false, subscript: false, superscript: false),
//             ListButtons(listStyles: false),
//             ParagraphButtons(
//                 textDirection: false, lineHeight: false, caseConverter: false),
//           ]),
//       controller: controller, //required
//       htmlEditorOptions: const HtmlEditorOptions(
//         hint: "ESCRIBA AQUI SU TEXTO...",
//         //initalText: "text content initial, if any",
//       ),
//       otherOptions: OtherOptions(
//         height: alto,
//       ),
//     );
//   }
// }
