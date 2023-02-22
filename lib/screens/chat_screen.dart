import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'get.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  Messages myMessages = Messages();

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
    User? loggedInUser;
  final TextEditingController _chatController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  String messages = '';
  String email = '';
  

  @override
  void initState() {
    super.initState();

     getCurrentUser();
  }

  void getCurrentUser() async {
      final user = await _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  getMessage() {
    final messages = _firestore.collection('messages');
    final data1 = <String, dynamic>{
      'email': loggedInUser?.email,
      'text': _chatController.text,
    };
    messages.doc('d1').set(data1);
    print(data1);
    return data1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: null,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                // messagesStream();
              },
            )
          ],
          title: Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
            child: Column(children: [
          StreamBuilder(
              stream: getMessage(),
              builder: (context, snapshot) {
                List<Text> messageWidgets = [];
                if (snapshot.hasData) {
                  final messageText = getMessage()['email'];
                  final messageSender = getMessage()['text'];

                  final messages = Text('$messageText from $messageSender');

                  messageWidgets.add(messages);
                }
                ;
                return Column(
                  children: messageWidgets,
                );
              }),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(children: [
                Expanded(
                    child: TextField(
                  controller: _chatController,
                  decoration: InputDecoration(border: InputBorder.none),
                  onChanged: (value) {
                    messages = value;
                  },
                )),
                TextButton(onPressed: () async {}, child: Text('Send')),
              ]),
            ),
          )
        ])));
  }
}

// final messages = _firestore.collection('messages');
// final data1 = <String, dynamic>{
//     'Text': messages,
//   'Sender': loggedInUser.email
// };
// messages.doc().set(data1);
// Messages + loggedInUser.email
// _firestore.collection('Messages').add({

// }
//

// final data1 = <String, dynamic>{
//   'name': 'GOlden',
//   'state': 'LAgos'
// };
// _firestore.doc('G1').set(data1);

// final docRef = _firestore.collection('messages').doc('G1');
// docRef.get().then((DocumentSnapshot doc){ final data = doc.data() as Map<String, dynamic>;}
// );

// final ref =   firestore.collection('messages').doc('G1').withConverter(fromFirestore: Messages.fromFirestore, toFirestore: (Messages messages, _)=> messages.toFirestore());

// final docSnap = await ref.get();
// final city = docSnap.data();
// if(city !=null){
//   print(city);
// }else{
//   print('No such Document.');
// }

// allMessages();

// Expanded(
//   child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
//     stream: _firestore.collection('messages').snapshots(),
//     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(
//           child: Text(" "),
//         );
//       }

// if (snapshot.hasData) {
//   if (snapshot.data!.docs.isNotEmpty) {
//     return ListView.builder(
//       itemCount: snapshot.data!.docs.length,
//     );
//   }
// }
// },
//     )
// )
