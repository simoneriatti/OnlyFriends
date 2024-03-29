import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:social_app_ui/util/data.dart';

class Profile_other extends StatefulWidget {
  @override
  _ProfileStateOther createState() => _ProfileStateOther();
}

class _ProfileStateOther extends State<Profile_other> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "OnlyFriends",
            style: GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          margin: EdgeInsets.all(0.5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
              ),
              const SizedBox(height: 10),
              _nomeutente("nomeutente"),
              const SizedBox(height: 2),
              _IDutente("IDutente"),
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buttonprofile("button share"),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildPost("Posts"),
                    _buildPosition("position"),
                    _buildPoints("point"),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  _descriptionTitle("descrizione"),
                ],
              ),
              _descriptionContainer("payloadDescription"),
              Row(
                children: <Widget>[
                  _postTitle("Post"),
                ],
              ),
              _PostContainer("PostContainer"),
              _PostContainer("PostContainer"),
              _PostContainer("PostContainer"),
              _PostContainer("PostContainer"),
              _PostContainer("PostContainer"),
              _PostContainer("PostContainer"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nomeutente(String nomeutente) {
    String nomeUtente = "NomeUtente";
    return Text(
      nomeUtente, // mettere variabile da collegare al db
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        backgroundColor: Color(0x00000000),
      ),
    );
  }

  Widget _IDutente(String IDutente) {
    String idutente = "IDutente";
    return Text(
      idutente,
      style: TextStyle(),
    );
  }

  Widget _buttonprofile(String button) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          TextButton(
            child: const Text("Share Profile",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(142, 0, 0, 0))),
          ),
        ],
      ),
    );
  }

  Widget _descriptionTitle(String title) {
    return const Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
        child: Text(
          "Description",
          style: TextStyle(fontStyle: FontStyle.italic),
        ));
  }

  Widget _postTitle(String title) {
    return const Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
        child: Text(
          "post",
          style: TextStyle(fontStyle: FontStyle.italic),
        ));
  }

  Widget _descriptionContainer(String payloadDescription) {
    const text = Text("Lorem ipsum");
    TextAlign.center;
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      height: 100,
      color: const Color.fromARGB(51, 163, 163, 163),
      padding: const EdgeInsets.all(16.0),
      child: text,
    );
  }

  Widget _PostContainer(String postcontainer) {
    double _currentSliderValue = 0;
    double likeNumber = 0;
    String points = "12";
    const data = 'Lorem ipsum ';
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1))), // child: Image.network(
                //   'https://www.example.com/image.jpg',
                //   height: 200,
                // ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'tag', //ATTENZIONE !! SE NO METTERE TUTTO CON UN IMMAGINO DI SFONDO SE C'è L'IMMAGINE ALTRIMENTI SOLO LA SCRITTA
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Text(
                          data,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Slider(
                //   value: _currentSliderValue,
                //   thumbColor: Colors.amber,
                //   activeColor: Colors.grey,
                //   inactiveColor: Colors.white,
                //   min: -10,
                //   max: 10,
                //   divisions: 20,
                //   label: _currentSliderValue.round().toString(),
                //   onChanged: (double value) {
                //     setState(() {
                //       _currentSliderValue = value;
                //     });
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 5.0),
                  child: LikeButton(size: 40, likeCount: likeNumber),
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
                      Icons.star_border_purple500,
                      color: Colors.grey,
                    ),
                    tooltip: 'Vota qui!',
                    iconSize: 40,
                  ),
                ),
                const Spacer(),
                Text(points),
                IconButton(
                  icon: const Icon(Icons.leaderboard),
                  tooltip: 'grazie gian<3',
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPost(String title) {
    var post =
        "3"; //collegare al db per avere i dati di follower posizione e post

    return Column(
      children: <Widget>[
        Text(
          post,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(),
        ),
      ],
    );
  }

  Widget _buildPosition(String title) {
    var position = "2"; //var da collegare al db

    return Column(
      children: <Widget>[
        Text(
          position,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(),
        ),
      ],
    );
  }

  Widget _buildPoints(String title) {
    var points = "1"; //var collegata al DB

    return Column(
      children: <Widget>[
        Text(
          points,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(),
        ),
      ],
    );
  }

  LikeButton({required int size, required likeCount}) {}
}
