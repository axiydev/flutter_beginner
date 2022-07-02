import 'package:flutter/material.dart';

class SixPage extends StatefulWidget {
  static const String path = '/six_page';
  const SixPage({super.key});

  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  int? _currentIndex = 0;
  List<Widget> myList = [
    Container(
      child: const Center(
        child: Text(
          '\u{1f3e0} Home',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ),
    Container(
        child: const Center(
      child: Text(
        '\u{27b0} Search',
        style: TextStyle(fontSize: 30),
      ),
    )),
    Container(
      child: const Center(
          child: Text(
        '\u{1f600} Ban User',
        style: TextStyle(fontSize: 30),
      )),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          NavigationRail(
              selectedIconTheme: const IconThemeData(color: Colors.green),
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: const Color(0xFF2d2e36),
              indicatorColor: Colors.grey,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('home')),
                NavigationRailDestination(
                    icon: Icon(Icons.search), label: Text('home')),
                NavigationRailDestination(
                    icon: Icon(Icons.no_accounts), label: Text('home')),
              ],
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedIndex: _currentIndex),
          Expanded(child: myList[_currentIndex!])
        ],
      )),
    );
  }
}
