import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/text_field_page/widgets/chat_app_text_field.dart';

/*
할일
1. 텍스트 필드 전체적인 색상 관리;
2. 리스트뷰로 각 텍스트필드 위젯들 나열;
3. 메인이랑 라우터로 연결;
*/

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: ChatAppTextField(),
              ))),
      backgroundColor: Colors.grey,
    );
  }
}
