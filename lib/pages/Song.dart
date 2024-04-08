import 'package:flutter/material.dart';
import 'package:groove/Image/ArtworkImage.dart';

void main() {
  runApp(MaterialApp(
    home: const SearchPage(),
  ));
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        OptionButton(),
        SizedBox(
          height: 40,
        ),
        Expanded(
            child: Center(
          child: ArtworkImage(image: "https://images.prismic.io/milanote/df7eeb83a07162b45ac2e882cac055de9411054a_cover.jpg?auto=compress,format"),
        ))
      ]),
    );
  }

  Container OptionButton() {
    return Container(
      margin: EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Row(
        children: [
          Transform.rotate(
            angle: -1.5708, // 90 degrees in radians
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          Spacer(),
          Icon(Icons.more_horiz_rounded)
        ],
      ),
    );
  }
}
