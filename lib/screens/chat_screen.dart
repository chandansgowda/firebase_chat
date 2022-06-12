
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chats/RxBZq7o9ac9Entp1W9Rf/messages').snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState==ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          final documents = streamSnapshot.data!.docs;
          return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (ctx, i) => Container(
                padding: EdgeInsets.all(8),
                child: Text(documents[i]['text']),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          FirebaseFirestore.instance.collection('chats/RxBZq7o9ac9Entp1W9Rf/messages').add({
            'text': "This Message was added by clicking the button"
          });
        },
      ),
    );
  }
}
