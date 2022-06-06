import 'package:firebase_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Chat",
      theme: ThemeData.dark(),
      home: ChatScreen(),
    );
  }
}
