import 'package:flutter/material.dart';

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
          Text(
            'Top Songs',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Column(
            children: List.generate(
              5,
              (index) => Card(
                elevation: 2.0,
                child: ListTile(
                  leading: Text('${index + 1}'),
                  title: Text('Song Title'),
                  subtitle: Text('Artist'),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
            ),
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