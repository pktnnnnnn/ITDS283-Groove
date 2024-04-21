import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:image_picker/image_picker.dart'; // Import Image Picker

void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfilePage(), // Set ProfilePage as the home page
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = 'Username';
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'New Username',
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _getImage,
                      child: Text('Select Image'),
                    ),
                  ),
                  SizedBox(width: 10),
                  _image != null
                      ? Expanded(
                          child: CircleAvatar(
                            backgroundImage: FileImage(_image!),
                            radius: 25,
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _username = _usernameController.text.isNotEmpty
                      ? _usernameController.text
                      : _username;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: _image != null ? FileImage(_image!) : null,
              radius: 110,
            ),
            SizedBox(height: 20),
            Text(_username, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('0'),
                Text('Following'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editProfile,
              child: Text('Edit Profile'),
            )
          ],
        ),
      ),
    );
  }
}
