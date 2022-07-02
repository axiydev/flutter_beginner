import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginner/consts/const_images.dart';
import 'package:flutter_beginner/pages/five_page/five_page.dart';
import 'package:flutter_beginner/pages/fourth_page/fourth_page.dart';
import 'package:flutter_beginner/pages/second_page/second_page.dart';
import 'package:flutter_beginner/pages/six_page/six_page.dart';
import 'package:flutter_beginner/pages/third_page/third_page.dart';

class FirstPage extends StatefulWidget {
  static const String path = '/first_page';
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int? _currentIndex = 0;
  late final List<Widget?> _list = [
    home(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
  ];

  Widget home() {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //gradientli image
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, SixPage.path);
              },
              child: _myContainer()),
          _customButton(onPressed: () {
            print("pressed");
            Navigator.pushNamed(context, ThirdPage.path);
          }),
          _customOutlinedButton(onPressed: () {
            print('button pressed');
          }),
          SizedBox(
            height: 60,
            width: 200,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(
                      fontSize: 23,
                    )),
                onPressed: () {},
                child: const Text("hello world")),
          ),

          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SecondPage.path);
              },
              child: const Text("gesture detector")),
        ]),
      ),
    );
  }

  void goToPage({required int? index}) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, FirstPage.path);
        break;
      case 1:
        Navigator.pushNamed(context, SecondPage.path);
        break;
      case 2:
        Navigator.pushNamed(context, ThirdPage.path);
        break;
      case 3:
        Navigator.pushNamed(context, FourthPage.path);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _list[_currentIndex!]!,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.black,
          icons: const [
            CupertinoIcons.home,
            CupertinoIcons.alarm,
            CupertinoIcons.slash_circle,
            CupertinoIcons.slash_circle,
          ],
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          activeIndex: _currentIndex!,
          gapLocation: GapLocation.center,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // goToPage(index: index);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, FivePage.path);
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget _customOutlinedButton({required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.black)),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: const Center(
          child: Text(
            'Press Button',
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _customButton({
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      splashColor: Colors.blue.withOpacity(0.5),
      child: Container(
        width: 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: const Text(
          'Press Button',
          style: TextStyle(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _myContainer() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            fit: BoxFit.cover, image: AssetImage(MyImage.nature)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.1),
              ]),
        ),
      ),
    );
  }
}
