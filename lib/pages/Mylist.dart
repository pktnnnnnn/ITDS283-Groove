import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groove/pages/AppBar.dart';

class Mylist extends StatefulWidget {
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My List',
      theme: ThemeData.dark(),
      home: const MyListPage(),
    );
  }
}

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          ListTile(
            leading: const Icon(Icons.queue_music),
            title: const Text('Playlists'),
            onTap: () {
              // Handle tap on Playlists
            },
          ),
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Songs'),
            onTap: () {
              // Handle tap on Songs
            },
          ),
          ListTile(
            leading: const Icon(Icons.album),
            title: const Text('Albums'),
            onTap: () {
              // Handle tap on Albums
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Artists'),
            onTap: () {
              // Handle tap on Artists
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Downloaded'),
            onTap: () {
              // Handle tap on Downloads
            },
          ),
          const SizedBox(height: 30),
          const Text(
            'Recents',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildStreamBuilder(),
        ],
      ),
    );
  }

  Widget _buildStreamBuilder() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Song').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Once data is loaded, display the list of recent items
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              // Return each recent item
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey, // Placeholder color
                  backgroundImage: NetworkImage(
                    '${data['image']}',
                  ),
                ),
                title: Text(
                  data['title'] ?? 'Unknown',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  data['artist'] ?? 'Unknown',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
