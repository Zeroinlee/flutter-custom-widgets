import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/text_field_page/text_field_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldPage(),
    );
  }
}
