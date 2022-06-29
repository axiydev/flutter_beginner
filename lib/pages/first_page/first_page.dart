import 'package:flutter/material.dart';
import 'package:flutter_beginner/consts/const_images.dart';
import 'package:flutter_beginner/pages/second_page/second_page.dart';
import 'package:flutter_beginner/pages/third_page/third_page.dart';

class FirstPage extends StatefulWidget {
  static const String path = '/first_page';
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //gradientli image
                _myContainer(),
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
                          primary: Colors.white,
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
      ),
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
