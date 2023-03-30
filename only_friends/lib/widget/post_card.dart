import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/model/postModel.dart';

class PostCard extends StatefulWidget {
  // final PostModel post;
  // const PostCard({Key? key, required this.post}) : super(key: key);
  final String user;
  const PostCard({Key? key, required this.user}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int likeNumber = 120;
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 600,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            border: Border(),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  // widget.post.idUtente,
                  widget.user,
                  style: GoogleFonts.poppins(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber,
                    backgroundImage:
                        AssetImage('assets/images/captainAmerica.png'),
                  ),
                ),
              ],
            ),
            Container(
              height: 450,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/imgPost1.jpg'),
                      fit: BoxFit.cover),
                  color: Colors.transparent),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Slider(
                  value: _currentSliderValue,
                  thumbColor: Colors.orange,
                  activeColor: Colors.grey,
                  inactiveColor: Colors.white,
                  min: -10,
                  max: 10,
                  divisions: 20,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => StatefulBuilder(
                          builder: (BuildContext context, setState) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: SizedBox(
                              height: 50,
                              child: Slider(
                                  value: _currentSliderValue,
                                  min: -10,
                                  max: 10,
                                  divisions: 20,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                  onChangeEnd: (double value) {
                                    print(value);
                                  }),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                    iconSize: 40,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
