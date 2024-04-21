import 'package:flutter/material.dart';
import 'package:groove/pages/Home.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Home Page'),
//       ),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
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
              Text(
                'Groove',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter username',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[800],
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[800],
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your forget password functionality here
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your login functionality here
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Add your create account functionality here
                },
                child: Text(
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

// class _MyAppState extends State<MyApp> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     LoginPage(),
//     HomePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My App'),
//         ),
//         body: _pages[_selectedIndex],
//         bottomNavigationBar: _selectedIndex == 1 ? BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.amber[800],
//           onTap: _onItemTapped,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_filled),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle_outlined),
//               label: 'My Account',
//             ),
//           ],
//         ) : null,
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}