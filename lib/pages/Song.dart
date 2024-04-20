import 'package:flutter/material.dart';
import 'package:groove/assets/ArtworkImage.dart';
import 'package:music/music.dart';

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
  late MusicPlayer player;
  late Music music;
  bool isPlaying = false;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    player = MusicPlayer(
      onLoading: _onLoading,
      onPlaying: _onPlaying,
      onPaused: _onPaused,
      onStopped: _onStopped,
      onCompleted: _onCompleted,
      onDuration: _onDuration,
      onPosition: _onPosition,
      onError: _onError,
    );

    music = Music(
      id: '_KzHGbpxMOY',
      artist: '88rising',
      title: 'Rich Brian, NIKI, & Warren Hue - California',
      image: 'https://i.ytimg.com/vi/_KzHGbpxMOY/mqdefault.jpg',
      url: 'https://media1.vocaroo.com/mp3/1ga9focwkrUs',
      duration: Duration(seconds: 230),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // Music player callbacks
  void _onLoading() {
    // Handle loading state if needed
  }

  void _onPlaying() {
    setState(() {
      isPlaying = true;
    });
  }

  void _onPaused() {
    setState(() {
      isPlaying = false;
    });
  }

  void _onStopped() {
    setState(() {
      isPlaying = false;
    });
  }

  void _onCompleted() {
    setState(() {
      isPlaying = false;
    });
  }

  void _onDuration(Duration duration) {
    // Handle duration if needed
  }

  void _onPosition(Duration position) {
    // Handle position if needed
  }

  void _onError(String error) {
    // Handle error if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OptionButton(),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Center(
              child: ArtworkImage(
                image: music.image,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(music.title),
                          Text(music.artist),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Slider(
                    value: 0, // Add functionality for playback position
                    onChanged: (double value) {
                      // Update playback position
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Implement skip previous functionality
                        },
                        icon: Icon(Icons.skip_previous),
                      ),
                      IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            player.pause();
                          } else {
                            player.play(music);
                          }
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement skip next functionality
                        },
                        icon: Icon(Icons.skip_next),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Implement shuffle functionality
                        },
                        icon: Icon(Icons.shuffle),
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement repeat functionality
                        },
                        icon: Icon(Icons.repeat),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
            child: Icon(Icons.arrow_back_ios_new),
          ),
          Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
