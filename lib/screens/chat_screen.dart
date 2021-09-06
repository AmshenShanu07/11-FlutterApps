import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

final db = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // String name =
  var user = FirebaseAuth.instance.currentUser!;
  String message = '';
  String name = '';
  final messageTextController = TextEditingController();

  List<Widget> msgs = [];

  void msgSnap() async {
    await for (var snap in db.collection('messages').snapshots()) {
      snap.docs.forEach((element) {
        print(element.data());

        setState(() {
          msgs.add(Bubble(
              name: element['name'],
              msg: element['msg'],
              isMe: element['name'] == name));
        });
      });
    }
  }

  void getmMsg() {
    db.collection("messages").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result);
        setState(() {
          msgs.add(Bubble(
              name: result['name'],
              msg: result['msg'],
              isMe: result['name'] == name));
        });
      });
    });
  }

  void sendMsg(msg) {
    db
        .collection('messages')
        .add({'name': name, 'msg': msg, 'time': DateTime.now()});
    setState(() {
      message = '';
    });
  }

  @override
  void initState() {
    super.initState();
    name = user.email!.split('@')[0];
    setState(() {
      user = FirebaseAuth.instance.currentUser!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('How is Your Day?'),
        backgroundColor: Color(0xFFE57375),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: db.collection('messages').orderBy('time').snapshots(),
                builder: (context, snap) {
                  List<Widget> msgs = [];
                  if (snap.hasData) {
                    for (var msg in snap.data!.docs) {
                      msgs.insert(
                          0,
                          Bubble(
                              name: msg['name'],
                              msg: msg['msg'],
                              isMe: msg['name'] == name));
                    }
                  }
                  return Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      reverse: true,
                      children: msgs.map((e) => e).toList(),
                    ),
                  ));
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      sendMsg(message);
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  Bubble({required this.name, required this.msg, required this.isMe});

  final String name;
  final String msg;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 200),
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 12,
                    color: isMe ? Colors.black87 : Colors.red[300]),
              ),
              Text(
                msg,
                style: TextStyle(color: isMe ? Colors.white : Colors.grey[700]),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: isMe ? Color(0xFFE57375) : Colors.white,
            border: Border.all(
              color: Color(0xFFE57375),
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: isMe ? Radius.circular(10) : Radius.circular(0),
                topRight:
                    isMe == false ? Radius.circular(10) : Radius.circular(0)),
          ),
        ),
      ],
    );
  }
}
