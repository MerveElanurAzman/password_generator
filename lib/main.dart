import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFAB91)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Password Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String password = ''; // Şifreyi tutmak için bir değişken tanımla

  String generatePassword() {
    const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const String numericChars = '0123456789';
    const String specialChars = '[]()%&+^!?*#£+-/';

    String allChars = lowercaseChars + numericChars + specialChars;
    password = '';

    for (int i = 0; i < 8; i++) {
      int randomIndex = Random().nextInt(allChars.length);
      password += allChars[randomIndex];
    }

    return password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.menu_rounded, color: Colors.white),
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
              child: Text(
                password,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    generatePassword();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange[200],
                  shadowColor: Colors.deepOrange[400],
                  elevation: 10,
                ),
                child: const Text(
                  "Generate Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(255, 138, 101, 1),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(255, 138, 101, 1),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromRGBO(255, 138, 101, 1),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
