import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (ctx, i) => Container(
                padding: EdgeInsets.all(8),
                child: Text("This is Chat Screen"),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FirebaseFirestore.instance.collection('chats/RxBZq7o9ac9Entp1W9Rf/messages').snapshots().listen((data) {
            data.docs.forEach((d) {
              print(d['text']);
            });
          });
        },
      ),
    );
  }
}
