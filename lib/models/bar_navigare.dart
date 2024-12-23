import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star/pages/glavanaia_page.dart';
import 'package:star/pages/home_page.dart';
import 'package:star/pages/note_page.dart';
import 'package:star/pages/searching_page.dart';

class BarNavigare extends StatefulWidget {
  const BarNavigare({super.key});

  @override
  State<BarNavigare> createState() => _BarNavigareState();
}

class _BarNavigareState extends State<BarNavigare> {
  int _currentIndex = 0;

  final List<Widget> _tabViews = [
    const HomePage(),
    const GlavanaiaPage(),
    const SearchingPage(),
  ];

  final List<IconData> _tabIcons = [
    CupertinoIcons.home,
    CupertinoIcons.book,
    CupertinoIcons.infinite
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFCF596),
      body: _tabViews[_currentIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          Material(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              height: height * 0.12,
              child: CupertinoTabBar(
                backgroundColor: Colors.transparent,
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Icon(_tabIcons[0]),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Icon(_tabIcons[1]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.05,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotePage(),
                      ));
                },
                backgroundColor: const Color(0xffD5CA63),
                child: const Icon(
                  color: Colors.black,
                  CupertinoIcons.add,
                  size: 30,
                  weight: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
