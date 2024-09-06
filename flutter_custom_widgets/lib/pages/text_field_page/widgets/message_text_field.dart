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

class MessageTextField extends TextField {
  final IconButton iconButton;

  const MessageTextField({
    super.key,
    super.maxLines = 4,
    super.minLines = 1,
    super.onChanged,
    super.controller,
    required this.iconButton,
    super.decoration = const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        hintText: '메시지를 입력하세요',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          // borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          // borderRadius: BorderRadius.circular(25),
        ),
        suffixIcon: Visibility(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: SizedBox(
            height: 30,
            child: Icon(
              Icons.send,
              color: Color(0xffE0E0E0),
              size: 16,
            ),
            // style: IconButton.styleFrom(
            //   padding: const EdgeInsets.only(bottom: 1),
            //   shape: const CircleBorder(),
            //   backgroundColor: const Color(0xFF6601e4),
            // ),
          ),
        ))),
  });
}
