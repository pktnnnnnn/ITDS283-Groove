import 'package:flutter/material.dart';
import 'package:groove/pages/AppBar.dart';

class Mylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My List',
      theme: ThemeData.dark(),
      home: MyListPage(),
    );
  }
}

class MyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          ListTile(
            leading: Icon(Icons.queue_music),
            title: Text('Playlists'),
            onTap: () {
              // Handle tap on Playlists
            },
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Songs'),
            onTap: () {
              // Handle tap on Songs
            },
          ),
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Albums'),
            onTap: () {
              // Handle tap on Albums
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Artists'),
            onTap: () {
              // Handle tap on Artists
            },
          ),
          ListTile(
            leading: Icon(Icons.file_download),
            title: Text('Downloaded'),
            onTap: () {
              // Handle tap on Downloads
            },
          ),
          SizedBox(height: 30),
          Text(
            'Recents',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Example of recent items
          _buildRecentItem(context, 'Liked Songs', 'Playlist'),
          _buildRecentItem(context, 'Playlist name', 'Playlist'),
          _buildRecentItem(context, 'Playlist name', 'Playlist'),
          _buildRecentItem(context, 'Playlist name', 'Playlist'),
          _buildRecentItem(context, 'Artist', 'Artist'),
          _buildRecentItem(context, 'Artist', 'Artist'),
        ],
      ),

    );
  }

  Widget _buildRecentItem(BuildContext context, String title, String subtitle) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(title[0]), // Display first letter of the title
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        // Handle tap on recent item
      },
    );
  }
}
