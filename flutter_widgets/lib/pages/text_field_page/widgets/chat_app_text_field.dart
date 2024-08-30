import 'package:flutter/material.dart';

/*
  첫 프로젝트에서 만든 채팅창;
  * 해야될일
  1. 포커스 관리;
  
*/

class ChatAppTextField extends StatefulWidget {
  const ChatAppTextField({super.key});

  @override
  State<ChatAppTextField> createState() => _ChatAppTextFieldState();
}

class _ChatAppTextFieldState extends State<ChatAppTextField> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 4,
      controller: _controller,
      onChanged: (value) => setState(() {}),
      // 입력창
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        hintText: '메시지를 입력하세요',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        // 보내기 버튼
        suffixIcon: Visibility(
          visible: _controller.text.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Transform.rotate(
                angle: -0.5,
                child: IconButton(
                  onPressed: () => setState(() {
                    _sendMessage();
                    _controller.clear();
                  }),
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xffE0E0E0),
                    size: 16,
                  ),
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.only(bottom: 1),
                    shape: const CircleBorder(),
                    backgroundColor: const Color(0xFF6601e4),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
