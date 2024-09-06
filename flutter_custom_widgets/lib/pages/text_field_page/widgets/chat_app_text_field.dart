import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/*
 * 1. const 기준을 모르겠음;
 *    좀더 공부해보기;
 * 1-2. Container()는 왜 const가 안되는데?
 * 2. BorderRadius 넣기
 * 3. IconButton 상속받기;
 *    TextField랑 IconButton이랑 이중상속 받아야할듯;
 * 4. onChanged는 내부적으로 처리하고 싶음;
 *    setState를 어캐집어넣지?
 * 5. onPressed는 인스턴스화 할때 외부에서 받아오고 싶음;
 * 
 (일단 애니메이션 연구)
 텍필, 아이콘버튼


아니면 차라리 text_field.dart를 복붙한다음에 커스텀으로 바꿔버릴까?

 */

class ChatAppTextField extends StatefulWidget {
  const ChatAppTextField({
    super.key,
  });

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
            child: SizedBox(
              height: 30,
              child: Padding(
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
      ),
    );
  }
}
