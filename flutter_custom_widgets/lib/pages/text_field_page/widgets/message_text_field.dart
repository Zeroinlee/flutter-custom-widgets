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
 */

//
class MessageTextField extends StatefulWidget {
  const MessageTextField({
    super.key,
    this.hintText,
    required this.controller,
    required this.onPressed,
    this.decoration,
  });

  final String? hintText;
  final TextEditingController controller;
  final void Function() onPressed;
  final InputDecoration? decoration;

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  // final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // void _sendMessage() {
  //   setState(() {
  //     text = _controller.text;
  //     FocusScope.of(context).unfocus();
  //     _controller.clear();
  //   });
  // }

  @override
  void dispose() {
    widget.controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 4,
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: (value) => setState(() {}),
      style: const TextStyle(fontSize: 16, color: Colors.white),
      // 입력창
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: widget.hintText ?? '메시지를 입력하세요',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xffE0E0E0).withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xffE0E0E0).withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        // 보내기 버튼
        suffixIcon: Visibility(
          visible: widget.controller.text.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Transform.rotate(
                angle: -0.5,
                child: IconButton(
                  onPressed: widget.onPressed,
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
