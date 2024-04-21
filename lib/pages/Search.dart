import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";
  List<Map<String, dynamic>> data = [
    // Your data here
    {
      'title': 'Less of you',
      'artist': 'Keshi',
      'image': 'https://i.pinimg.com/564x/0f/e1/58/0fe158de14c78a315fc87a01da586ddd.jpg',
      'audio':
          'https://firebasestorage.googleapis.com/v0/b/groove-c25e1.appspot.com/o/keshi%20-%20less%20of%20you%20(Audio).mp3?alt=media&token=055b37e6-442a-4fa9-b890-2eae96b53a88'
    },
  ];

  @override
  void initState() {
    super.initState();
    addData();
  }

  void addData() async {
    for (var element in data) {
      await FirebaseFirestore.instance.collection('songs').add(element);
    }
    print('all data added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'Search',
            ),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('songs').snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              var data =
                  snapshots.data!.docs[index].data() as Map<String, dynamic>;

              if (name.isEmpty ||
                  data['title']
                      .toString()
                      .toLowerCase()
                      .startsWith(name.toLowerCase())) {
                return ListTile(
                  title: Text(
                    data['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    data['artist'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data['image']),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}
