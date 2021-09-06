import 'package:flutter/material.dart';
// import 'package:facebook/constants.dart';

class StorySession extends StatelessWidget {
  const StorySession({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      // width: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          StoryCard(
            dp: 'assets/posts/1.jpeg',
            statusBg: 'assets/story/1.jpeg',
            name: 'Amshen \nYesudas',
          ),
          StoryCard(
            dp: 'assets/posts/2.jpeg',
            statusBg: 'assets/story/2.jpeg',
            name: 'Alisha \nYesudas',
          ),
          StoryCard(
            dp: 'assets/posts/3.jpeg',
            statusBg: 'assets/story/3.jpeg',
            name: 'Rosmary \nYesudas',
          ),
          StoryCard(
            dp: 'assets/posts/4.jpeg',
            statusBg: 'assets/story/4.jpeg',
            name: 'CA \nYesudas',
          ),
          StoryCard(
            dp: 'assets/posts/5.jpeg',
            statusBg: 'assets/story/5.jpeg',
            name: 'Bunny \nDoggy',
          ),
          StoryCard(
            dp: 'assets/posts/6.jpeg',
            statusBg: 'assets/story/6.jpeg',
            name: 'Bunny \nDoggy',
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class StoryCard extends StatelessWidget {
  StoryCard({required this.dp, required this.statusBg, required this.name});

  String dp;
  String statusBg;
  String name;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      width: 110,
      child: Stack(
        children: [
          Positioned(
            top: 7,
            left: 5,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 14,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(dp),
                  radius: 12,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: DecorationImage(
          image: AssetImage(statusBg),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
