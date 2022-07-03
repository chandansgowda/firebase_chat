import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/screens/auth_screen.dart';
import 'package:firebase_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Chat",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),  builder: (ctx, userSnapshot){
        if (userSnapshot==null){
          return AuthScreen();
        }
        else{
          return ChatScreen();
        }
      }),
    );
  }
}
