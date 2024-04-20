import 'package:flutter/material.dart';
import 'package:groove/pages/Search.dart';
import 'package:groove/pages/Song.dart';

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
    SongPage(),
    RadioPage(),
    MyListPage(),
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
              icon: Icon(Icons.account_circle_outlined),
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
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
        ],
      ),
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


