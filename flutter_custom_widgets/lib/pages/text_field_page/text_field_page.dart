import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/text_field_page/widgets/chat_app_text_field.dart';
import 'package:flutter_widgets/pages/text_field_page/widgets/message_text_field.dart';

/*
할일
1. 텍스트 필드 전체적인 색상 관리;
2. 리스트뷰로 각 텍스트필드 위젯들 나열;
3. 메인이랑 라우터로 연결;
*/

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller = TextEditingController();
  String text = '';

  void _sendMessage() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        text = _controller.text;
        FocusScope.of(context).unfocus();
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Text Field'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Text: $text',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                      color: const Color(0xFF181818),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 10),
                        child: MessageTextField(
                          controller: _controller,
                          onPressed: _sendMessage,
                        ),
                      )),
                  Container(
                      color: const Color(0xFF181818),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 10),
                        child: MessageTextField(
                          controller: _controller,
                          onPressed: _sendMessage,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
