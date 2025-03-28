import 'package:flutter/material.dart';
import 'package:recipie/feature/home/view/pages/cart_page.dart';
import 'package:recipie/feature/home/view/pages/catogory_page.dart';
import 'package:recipie/feature/home/view/pages/home_page.dart';
import 'package:recipie/feature/home/view/pages/search_page.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedindex = 0;

  final List<Widget> pages = [
    const Homepage(),
    const Categorypage(),
    const Searchpage(),
    const FavoratPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "CATEGORY"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: "FAVORATE")
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red[400],
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
    );
  }
}
