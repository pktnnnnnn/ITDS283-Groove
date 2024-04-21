// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groove/pages/Profile.dart';
import 'package:groove/pages/Song.dart';
import 'package:groove/pages/AppBar.dart';
import 'package:groove/pages/Mylist.dart';
import 'package:groove/pages/Radio.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SongPage(
      songUrl:
          'https://firebasestorage.googleapis.com/v0/b/groove-c25e1.appspot.com/o/keshi%20-%20less%20of%20you%20(Audio).mp3?alt=media&token=055b37e6-442a-4fa9-b890-2eae96b53a88',
      title: 'Less of you',
      artist: 'Keshi',
      image:
          'https://i.pinimg.com/564x/0f/e1/58/0fe158de14c78a315fc87a01da586ddd.jpg',
    ),
    RadioPage(),
    MyListPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note_rounded),
              label: 'Samples',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_outlined),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add_check_circle_outlined),
              label: 'My List',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Text(
            'Recommended',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          buildSongList(
              containerHeight: 120, cardWidth: 200, ParentHeight: 200),
          SizedBox(height: 20.0),
          Text(
            'Made for you',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Column(
            children: [
              buildSongList(
                  containerHeight: 200,
                  cardWidth: 200,
                  scrollDirection: Axis.vertical,
                  ParentHeight: MediaQuery.of(context).size.height),
            ],
          ),
        ],
      ),
    );
  }

    Widget buildSongList({
  required double ParentHeight,
  required double containerHeight,
  required double cardWidth,
  Axis scrollDirection = Axis.horizontal,
}) {
  return Container(
    height: ParentHeight,
    child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Song').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        // If the stream has data
        return Container(
          height: containerHeight,
          child: ListView.builder(
            scrollDirection: scrollDirection,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var songData = snapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongPage(
                        songUrl: songData['audio'] ?? "", // Pass the audio URL
                        title: songData['title'] ?? "", // Pass the song title
                        artist: songData['artist'] ?? "", // Pass the artist
                        image: songData['image'] ?? "", // Pass the image URL
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      width: cardWidth,
                      height: containerHeight,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.network(
                              '${songData['image']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Title and Artist overlay
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.black54,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    songData['title'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    songData['artist'],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

    }

