import 'package:flutter/material.dart';
import 'package:groove/pages/Profile.dart';
import 'package:groove/pages/Song.dart';
import  'package:groove/pages/AppBar.dart';
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
      songUrl: 'https://firebasestorage.googleapis.com/v0/b/groove-c25e1.appspot.com/o/keshi%20-%20less%20of%20you%20(Audio).mp3?alt=media&token=055b37e6-442a-4fa9-b890-2eae96b53a88',
      title: 'Less of you',
      artist: 'Keshi',
      image: 'https://i.pinimg.com/564x/0f/e1/58/0fe158de14c78a315fc87a01da586ddd.jpg',
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


class HomePage extends StatelessWidget {
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
          Container(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2.0,
                  child: Container(
                    width: 120.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Song title'),
                        SizedBox(height: 5.0),
                        Text('Artist'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Made for you',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Card(
            elevation: 2.0,
            child: Container(
              height: 200.0,
              child: Center(
                child: Text('Placeholder for content'),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Card(
            elevation: 2.0,
            child: ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text('Song Title'),
              subtitle: Text('Artist'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Add your more actions functionality here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


