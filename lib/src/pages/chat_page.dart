import 'package:chat_app/src/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User loggedUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final User user = _auth.currentUser;
      print(user);
      if (user != null) {
        loggedUser = user;
        print(loggedUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   try {
  //     final messages = await _firestore.collection('messages').get();

  //     for (var message in messages.docs) {
  //       print(message.data());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void messagesStream() async {
    try {
      final messages = _firestore.collection('messages').snapshots();

      await for (var snapshot in messages) {
        for (var message in snapshot.docs) {
          print(message.data());
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('iChat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              // getMessages();
              messagesStream();
              // _auth.signOut();
              // // Navigator.pushNamed(context, 'sign_in_page');
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //   'sign_in_page',
              //   (route) => false,
              // );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Expanded(child: Text('Listado de mensajes')),
          _buildMessagesList(),
          _sendMessageArea(),
        ],
      ),
    );
  }

  _buildMessagesList() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && snapshot.data == null) {
            return CircularProgressIndicator();
          }
          final List<QueryDocumentSnapshot> messages = snapshot.data.docs;
          final List<Widget> messagesList = [];

          for (var message in messages) {
            final text = message.data()['text'];
            final author = message.data()['author'];
            final currentUser = loggedUser.email;

            final messagesWidget = ChatBubble(
              text: text,
              author: author,
              isMe: currentUser == author,
            );
            messagesList.add(messagesWidget);
          }
          return ListView(
            padding: EdgeInsets.all(20.0),
            children: messagesList,
          );
        },
      ),
    );
  }

  _sendMessageArea() {
    return Container(
      height: 70,
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.tag_faces),
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            onChanged: (value) {
              messageText = value;
            },
            decoration:
                InputDecoration.collapsed(hintText: 'Escribe un mensaje...'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            _firestore.collection('messages').add({
              'text': messageText,
              'author': loggedUser.email,
            });
          },
        ),
      ]),
    );
  }
}
