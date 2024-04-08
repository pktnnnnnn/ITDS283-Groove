import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:groove/Image/ArtworkImage.dart';

void main() {
  runApp(MaterialApp(
    home: const SongPage(),
  ));
}

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
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
          child: ArtworkImage(
              image:
                  "https://qodeinteractive.com/magazine/wp-content/uploads/2020/06/16-Tame-Impala.jpg"),
        )),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Song Title"), Text("Artist")],
                  ),
                  Icon(Icons.add_circle_outline_rounded)
                ],
              ),
              ProgressBar(
                progress: Duration(milliseconds: 1000),
                buffered: Duration(milliseconds: 2000),
                total: Duration(milliseconds: 5000),
                onSeek: (duration) {
                  print('User selected a new time: $duration');
                },
              ),
            ]),
          ),
        )
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
