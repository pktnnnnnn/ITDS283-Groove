import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groove/pages/Song.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          FutureBuilder<QuerySnapshot>(
            future:
                FirebaseFirestore.instance.collection('Song').limit(5).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final songs = snapshot.data!.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Songs',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: List.generate(
                      songs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongPage(
                                songUrl: songs[index]['audio'] ??
                                    "", // Pass the audio URL
                                title: songs[index]['title'] ??
                                    "", // Pass the song title
                                artist: songs[index]['artist'] ??
                                    "", // Pass the artist
                                image: songs[index]['image'] ??
                                    "", // Pass the image URL
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2.0,
                          child: ListTile(
                            leading: Text('${index + 1}'),
                            title: Text(songs[index]['title'] ?? 'Unknown'),
                            subtitle: Text(songs[index]['artist'] ?? 'Unknown'),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          SizedBox(height: 20.0),
          Text(
            'New waves',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircularCard(),
              _buildCircularCard(),
              _buildCircularCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularCard() {
    return Card(
      elevation: 2.0,
      shape: CircleBorder(),
      child: Container(
        width: 100.0,
        height: 100.0,
        child: Center(
          child: Text('Artist'),
        ),
      ),
    );
  }
}
