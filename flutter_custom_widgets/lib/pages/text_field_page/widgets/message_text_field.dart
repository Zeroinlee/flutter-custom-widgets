import 'package:flutter/material.dart';

/*  === 09.07 이후 목표 ====
  -> 보내기 버튼을 눌렀을때 입력정보(_controller.text)만 보내고
  _controller, _focusNode 같은건 내부에서 완결 시키고 싶음
 */
class MessageTextField extends StatefulWidget {
  const MessageTextField({
    super.key,
    required this.controller,
    required this.onPressed,
    this.focusNode,
    this.hintText = '메시지를 입력하세요',
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    this.borderSide = const BorderSide(
      color: Color.fromRGBO(224, 224, 224, 0.5),
    ),
    this.sendButton,
  });

  final TextEditingController controller;
  final void Function() onPressed;
  final FocusNode? focusNode;

  // Input Field
  final String hintText;
  final TextStyle textStyle;

  // Text Field Border
  final BorderSide borderSide;

  // Send Button
  final Widget? sendButton;

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 4,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: (value) => setState(() {}),
      // Input Field
      style: widget.textStyle,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: widget.borderSide,
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.borderSide,
          borderRadius: BorderRadius.circular(25),
        ),
        // Send Button
        suffixIcon: Visibility(
          visible: widget.controller.text.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: widget.sendButton ??
                  IconButton(
                    // (수정해야될곳) 필요없지만 필요한 부분(데이터만 전송된다면 필요없어짐)
                    onPressed: widget.onPressed,
                    icon: Transform.rotate(
                      angle: -0.5,
                      child: const Icon(
                        Icons.send,
                        color: Color(0xffE0E0E0),
                        size: 16,
                      ),
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
    );
  }
}
