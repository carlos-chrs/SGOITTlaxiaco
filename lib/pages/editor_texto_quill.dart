import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
// import 'package:web_app_tec/utils/screen_size.dart';

class TextditorHTML extends StatefulWidget {
  const TextditorHTML({super.key, required this.controller});
  final QuillEditorController controller;
  @override
  State<TextditorHTML> createState() => _TextditorHTMLState();
}

class _TextditorHTMLState extends State<TextditorHTML> {
  ///[controller] create a QuillEditorController to access the editor methods
  late QuillEditorController controller;

  ///[customToolBarList] pass the custom toolbarList to show only selected styles in the editor

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.size,
    ToolBarStyle.background,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
    ToolBarStyle.clean,
  ];

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal);
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black12, fontWeight: FontWeight.normal);

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });
  }

  @override
  void dispose() {
    /// please do not forget to dispose the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenSize.i.upadate(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // width: ScreenSize.i.width * 0.99,
            child: ToolBar.scroll(
                toolBarConfig: customToolBarList,
                toolBarColor: _toolbarColor,
                padding: const EdgeInsets.all(8),
                iconSize: 25,
                iconColor: _toolbarIconColor,
                activeIconColor: Color.fromARGB(255, 18, 26, 255),
                controller: controller,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                customButtons: []),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SizedBox(
              child: Container(
                // width: 800,
                // height: 800,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(-2, 0),
                  ),
                ]),
                child: QuillHtmlEditor(
                  loadingBuilder: (context) {
                    return Container(
                      color: Colors.transparent,
                      height: 1,
                      width: 1,
                    );
                  },
                  hintText: '...',
                  controller: controller,
                  isEnabled: true,
                  minHeight: 200,
                  textStyle: _editorTextStyle,
                  hintTextStyle: _hintTextStyle,
                  hintTextAlign: TextAlign.start,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  hintTextPadding: const EdgeInsets.only(left: 20),
                  backgroundColor: _backgroundColor,
                  onFocusChanged: (hasFocus) => {},
                  // debugPrint('has focus $hasFocus'),
                  onTextChanged: (text) => {},
                  // debugPrint('widget text change $text'),
                  onEditorCreated: () {
                    // debugPrint('Editor has been loaded');
                    // setHtmlText('Testing text on load');
                  },
                  onEditorResized: (height) => {},
                  // debugPrint('Editor resized $height'),
                  onSelectionChanged: (sel) => {},
                  // debugPrint('index ${sel.index}, range ${sel.length}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: _toolbarIconColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: _toolbarColor),
          )),
    );
  }

  ///[getHtmlText] to get the html text from editor
  Future<String?> getHtmlText() async {
    String? htmlText = await controller.getText();
    return htmlText;
  }

  QuillEditorController getController() {
    return controller;
  }

  ///[setHtmlText] to set the html text to editor
  void setHtmlText(String text) async {
    await controller.setText(text);
  }

  ///[insertNetworkImage] to set the html text to editor
  void insertNetworkImage(String url) async {
    await controller.embedImage(url);
  }

  ///[insertVideoURL] to set the video url to editor
  ///this method recognises the inserted url and sanitize to make it embeddable url
  ///eg: converts youtube video to embed video, same for vimeo
  void insertVideoURL(String url) async {
    await controller.embedVideo(url);
  }

  /// to set the html text to editor
  /// if index is not set, it will be inserted at the cursor postion
  void insertHtmlText(String text, {int? index}) async {
    await controller.insertText(text, index: index);
  }

  /// to clear the editor
  void clearEditor() => controller.clear();

  /// to enable/disable the editor
  void enableEditor(bool enable) => controller.enableEditor(enable);

  /// method to un focus editor
  void unFocusEditor() => controller.unFocus();
}
