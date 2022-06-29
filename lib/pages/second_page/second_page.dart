import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginner/pages/first_page/first_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SecondPage extends StatefulWidget {
  static const path = '/second_page';
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController? _textEditingController;
  String? _text = "kiritilgan text";
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController!.dispose();
    super.dispose();
  }

  void _showTextToUser() {
    if (_textEditingController!.text.isNotEmpty) {
      setState(() {
        _text = _textEditingController!.text;
      });
    }
  }

  void _clearTextField() {
    if (_textEditingController!.text.isNotEmpty) {
      _textEditingController!.clear();
      setState(() {
        _text = "kiritilgan text";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text!,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              maxLines: 1,
              controller: _textEditingController,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 18),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),

                suffixIcon: InkWell(
                    onTap: _clearTextField, child: const Icon(Icons.clear)),
                hintText: 'qidirish...',
                hintStyle: const TextStyle(color: Colors.red),
                // disabledBorder: OutlineInputBorder(
                //     borderSide: const BorderSide(width: 2, color: Colors.orange),
                //     borderRadius: BorderRadius.circular(15)),

                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(width: 2, color: Colors.red),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                filled: true,
                // fillColor: Colors.red
              ),
            ),
          ),
          CupertinoButton.filled(
              onPressed: _showTextToUser, child: const Text('show text'))
        ],
      ),
      floatingActionButton: SpeedDial(
        elevation: 5,
        overlayOpacity: 0.6,
        overlayColor: Colors.grey,
        direction: SpeedDialDirection.up,
        foregroundColor: Colors.red,
        backgroundColor: Colors.green,
        activeBackgroundColor: Colors.grey,
        tooltip: 'Bosma',
        activeIcon: Icons.clear,
        icon: Icons.menu,
        spacing: 10,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
              onTap: () => Navigator.pushNamed(context, FirstPage.path),
              label: "edit",
              child: const Icon(Icons.home),
              backgroundColor: Colors.green),
          SpeedDialChild(label: "pen", child: const Icon(Icons.home)),
          SpeedDialChild(
              label: "search",
              child: const Icon(
                Icons.search,
              ),
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
