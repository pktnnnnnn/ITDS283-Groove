import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groove/pages/AppBar.dart';
import 'package:groove/pages/Song.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          FutureBuilder<QuerySnapshot>(
            future:
                FirebaseFirestore.instance.collection('Song').limit(10).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final songs = snapshot.data!.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Songs',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
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
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(songs[index]['image'] ?? ''),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black
                                      .withValues(alpha: 0.5), // Adjust opacity here
                                  BlendMode
                                      .darken, // You can change the blend mode as needed
                                ),
                              ),
                            ),
                            child: ListTile(
                              leading: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    color:
                                        Colors.white), // Change text color here
                              ),
                              title: Text(
                                songs[index]['title'] ?? 'Unknown',
                                style: const TextStyle(
                                    color:
                                        Colors.white), // Change text color here
                              ),
                              subtitle: Text(
                                songs[index]['artist'] ?? 'Unknown',
                                style: const TextStyle(
                                    color:
                                        Colors.white), // Change text color here
                              ),
                              trailing: const Icon(Icons.more_vert,
                                  color:
                                      Colors.white), // Change icon color here
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),

        ],
      ),
    );
  }

  Widget _buildCircularCard() {
    return const Card(
      elevation: 2.0,
      shape: CircleBorder(),
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Center(
          child: Text('Artist'),
        ),
      ),
    );
  }
}
