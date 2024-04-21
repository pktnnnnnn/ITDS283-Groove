import 'package:flutter/material.dart';
import 'package:groove/pages/Profile.dart';
import 'package:groove/pages/Search.dart';

AppBar MainAppBar(BuildContext context) {
  
    return AppBar(
      title: const Text('Groove'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),GestureDetector(
            // Wrap the CircleAvatar with GestureDetector
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://qodeinteractive.com/magazine/wp-content/uploads/2020/06/16-Tame-Impala.jpg'),
              radius: 16,
            ),
          ),
      ],
    );
  }