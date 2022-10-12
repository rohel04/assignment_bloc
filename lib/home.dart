import 'package:assignment/features/posts/presentation/pages/post_page.dart';
import 'package:assignment/features/users/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    PostPage(),
    UserPage(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 25,
        selectedItemColor: Color(0xFF363f93),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add_sharp), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users')
        ],
      ),
    );
  }
}
