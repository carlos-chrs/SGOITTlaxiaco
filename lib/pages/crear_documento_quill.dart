// import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_quill_to_pdf/core/options/html_converter_options.dart';
import 'package:quill_pdf_converter/quill_pdf_converter.dart';
import 'package:web_app_tec/pages/editor_test.dart';
import 'package:web_app_tec/utils/crear_pdf_web.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:flutter_quill_to_pdf/flutter_quill_to_pdf.dart' hide Rule;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

class CrearDocumentoPage extends StatefulWidget {
  CrearDocumentoPage({Key? key}) : super(key: key);

  @override
  State<CrearDocumentoPage> createState() => _CrearDocumentoPageState();
}

class _CrearDocumentoPageState extends State<CrearDocumentoPage> {
  final QuillController _quillController = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0));

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: Container(
        child: CustomTextEditor(
          controller: _quillController,
          alto: ScreenSize.i.heigth * 90,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_box),
                    ScreenSize.i.width > 750
                        ? const Text("Agregar campo")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {}),
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.clear_all),
                    ScreenSize.i.width > 750
                        ? const Text("limpiar todos los campos")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {
                  _quillController.clear();
                }),
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.preview),
                    ScreenSize.i.width > 750
                        ? const Text("Previsualizar")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {}),
            const Spacer(),
            ElevatedButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud_done),
                  ScreenSize.i.width > 750
                      ? const Text("crear y guardar")
                      : const SizedBox(),
                ],
              ),
              onPressed: () async {
                final pdfWidgets =
                    await _quillController.document.toDelta().toPdf();
                // String htmldata =
                //     convertDeltaToHtml(_quillController.document.toDelta());
                final doc = pw.Document();
                doc.addPage(pw.Page(
                    pageFormat: PdfPageFormat.letter,
                    build: (pw.Context context) {
                      return pw.Column(children: pdfWidgets); // Center
                    })); // Page// Page
                final bytes = await doc.save();
                saveAndLaunchFile(bytes.toList(), "document");
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  //it looks like
  String convertDeltaToHtml(Delta delta,
      [ConverterOptions? options,
      String Function(DeltaInsertOp customOp, DeltaInsertOp? contextOp)?
          customRenderCallback]) {
    final QuillDeltaToHtmlConverter converterDeltaToHTML =
        QuillDeltaToHtmlConverter(
      delta.toJson(),
      options ?? HTMLConverterOptions.options(),
    );
    converterDeltaToHTML.renderCustomWith =
        customRenderCallback; // use this callback if you want or need render a custom attribute or block
    return converterDeltaToHTML.convert();
  }
}

class CustomTextEditor extends StatefulWidget {
  CustomTextEditor({super.key, required this.controller, required this.alto});
  QuillController controller;
  double alto;
  @override
  State<CustomTextEditor> createState() => _CustomTextEditorState();
}

class _CustomTextEditorState extends State<CustomTextEditor> {
  // controller = widget.controller;

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto');
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.alto,
      child: Column(children: [
        QuillToolbar.simple(
          configurations: QuillSimpleToolbarConfigurations(
            controller: widget.controller,
            sharedConfigurations: const QuillSharedConfigurations(
              extraConfigurations: {},
              locale: Locale('de'),
            ),
          ),
        ),
        MyQuillToolbar(controller: widget.controller, focusNode: FocusNode()),
        Expanded(
          child: QuillEditor.basic(
            configurations: QuillEditorConfigurations(
              controller: widget.controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('de'),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
