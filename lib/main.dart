import 'package:flutter/material.dart';
import 'package:groove/pages/Home.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Groove',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter username',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[800],
                  contentPadding: const EdgeInsets.all(15.0),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[800],
                  contentPadding: const EdgeInsets.all(15.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your forget password functionality here
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your login functionality here
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MyApp()));
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Add your create account functionality here
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: LoginPage(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
