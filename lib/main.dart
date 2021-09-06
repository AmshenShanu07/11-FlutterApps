import 'package:flutter/material.dart';
import 'package:facebook/widgets/TopHeader.dart';
import 'package:facebook/widgets/TopCreate.dart';
import 'package:facebook/widgets/Story.dart';
import 'package:facebook/widgets/Post.dart';
import 'constants.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Topheader(),
          Create(),
          StorySession(),
          Divider(
            color: kColorGrey,
            height: 10,
            thickness: 10,
          ),
          PostCard(
            dp: 'assets/story/1.jpeg',
            post: 'assets/posts/1.jpeg',
            name: 'Amshen Yesudas',
          ),
          PostCard(
            dp: 'assets/story/2.jpeg',
            post: 'assets/posts/2.jpeg',
            name: 'Alisha Yesudas',
          ),
          PostCard(
            dp: 'assets/story/3.jpeg',
            post: 'assets/posts/3.jpeg',
            name: 'Neymar Jr',
          ),
          PostCard(
            dp: 'assets/story/4.jpeg',
            post: 'assets/posts/4.jpeg',
            name: 'Sergio Ramos',
          ),
          PostCard(
            dp: 'assets/story/5.jpeg',
            post: 'assets/posts/5.jpeg',
            name: 'Ca Yesudas',
          ),
          PostCard(
            dp: 'assets/story/6.jpeg',
            post: 'assets/posts/6.jpeg',
            name: 'Rosemary Yesudas',
          ),
        ],
      ),
    );
  }
}
