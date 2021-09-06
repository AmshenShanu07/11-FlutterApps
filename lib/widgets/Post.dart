import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:facebook/constants.dart';

// ignore: must_be_immutable
class PostCard extends StatefulWidget {
  PostCard({required this.dp, required this.post, required this.name});

  String dp;
  String post;
  String name;

  @override
  _PostCardState createState() =>
      _PostCardState(dp: this.dp, name: this.name, post: this.post);
}

class _PostCardState extends State<PostCard> {
  _PostCardState({required this.dp, required this.post, required this.name});

  String dp;
  String post;
  String name;

  bool liked = false;
  @override
  void toogleLike() {
    liked = !liked;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 15,
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(dp),
                      radius: 13,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Image.asset(post),
            margin: EdgeInsets.only(top: 5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 5),
            child: Text(
              '👍Amshen Yesudas and 7 others liked',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 12,
                fontFamily: 'helica',
              ),
            ),
          ),
          Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            height: 0.5,
            margin: EdgeInsets.only(
              top: 5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    toogleLike();
                  });
                },
                label: Text(
                  'Like',
                  style: TextStyle(fontSize: 12),
                ),
                icon: Icon(
                  liked
                      ? FontAwesomeIcons.solidThumbsUp
                      : FontAwesomeIcons.thumbsUp,
                  size: 12,
                  color: liked ? Colors.blue : null,
                ),
                style: TextButton.styleFrom(
                  primary: Colors.grey[800],
                  padding: EdgeInsets.all(10),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'Comment',
                  style: TextStyle(fontSize: 12),
                ),
                icon: Icon(
                  FontAwesomeIcons.comment,
                  size: 12,
                ),
                style: TextButton.styleFrom(
                  primary: Colors.grey[800],
                  padding: EdgeInsets.all(10),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'Share',
                  style: TextStyle(fontSize: 12),
                ),
                icon: Icon(
                  FontAwesomeIcons.share,
                  size: 12,
                ),
                style: TextButton.styleFrom(
                  primary: Colors.grey[800],
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 10,
            color: kColorGrey,
          )
        ],
      ),
    );
  }
}
