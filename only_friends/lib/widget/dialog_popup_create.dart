import 'package:flutter/material.dart';
import 'package:only_friends/screen/new_challenge.dart';
import 'package:only_friends/screen/new_post.dart';

class PopupExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The grayed-out background
        Container(
          color: Colors.grey.withOpacity(0.5),
        ),
        // The popup itself
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // The first button with a duel icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewChallenge())
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_kabaddi,
                          size: 64.0,
                          color: Colors.orange,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Crea una sfida",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    height: 200.0,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 16.0),
                // The second button with a post icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPost())
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.post_add,
                          size: 64.0,
                          color: Colors.orange,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Pubblica un post",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    height: 200.0,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
