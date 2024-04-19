import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:groove/assets/color.dart';
import 'package:groove/pages/Radio.dart';
import 'package:groove/pages/Song.dart';

void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    RadioPage(), // Include RadioPage in the list
    SongPage(), // Include SongPage in the list
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groove',
      theme: ThemeData(
        fontFamily: 'Outfit',
        scaffoldBackgroundColor: bgcolor,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor, // Set selected item color
          unselectedItemColor: Colors.white70, // Set unselected item color
          backgroundColor:
              secondaryColor, // Set navigation bar background color
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
              icon: Icon(Icons.person),
              label: 'My list',
            )
          ],
        ),
      ),
    );
  }
}
