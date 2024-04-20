import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:groove/assets/ArtworkImage.dart';
import 'package:just_audio/just_audio.dart';

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
  bool click = true;
  final player = AudioPlayer();
  bool isPlaying = false;
  String songUrl =
      "https://firebasestorage.googleapis.com/v0/b/groove-c25e1.appspot.com/o/keshi%20-%20less%20of%20you%20(Audio).mp3?alt=media&token=055b37e6-442a-4fa9-b890-2eae96b53a88";
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    bindPlayer();
  }

  bindPlayer() async {
    await player.setUrl(songUrl);
    duration = player.duration!;
    setState(() {});
    player.positionStream.listen((event) {
      Duration temp = event as Duration;
      position = temp;
      setState(() {});
    });
  }

  playerAction() {
    if (isPlaying) {
      player.pause();
    } else {
      player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        click = !click;
                      });
                    },
                    child: Icon((click == false)
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final seekposition = Duration(seconds: value.toInt());
                    await player.seek(seekposition);
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration))
                    ],
                  ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_previous_rounded),
                  ),
                  IconButton(
                    onPressed: playerAction,
                    icon: isPlaying
                        ? Icon(Icons.pause_rounded)
                        : Icon(Icons.play_arrow_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next_rounded),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.shuffle_rounded),
                  Icon(Icons.loop_rounded),
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }

  Container OptionButton() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: -1.5708, // 90 degrees in radians
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          Icon(Icons.more_horiz_rounded)
        ],
      ),
    );
  }
}

String formatTime(Duration duration) {
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
