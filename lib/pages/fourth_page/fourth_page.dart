import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  static const String path = '/fourth_page';
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _globalKey = GlobalKey<FormState>();
  String? _username = '';
  String? _password = '';
  late bool _isObscure = true;

  void _login(BuildContext context) {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      showBottomSheet(
          context: context,
          builder: (context) => Container(
                color: Colors.black,
                height: 50,
                width: double.maxFinite,
                child: const Text(
                  "Tabriklaymiz tizimga muvofaqiyatli otdingiz",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ));
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  validator: (text) => !text!.endsWith('@gmil.com')
                      ? "gmailni togri kirit"
                      : null,
                  onSaved: (String? newText) => _username = newText!,
                  decoration: InputDecoration(
                      hintText: 'gmail',
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  obscureText: _isObscure,
                  validator: (textPassword) => textPassword!.length >= 8
                      ? null
                      : 'Password required minimum 8 characters',
                  onSaved: (newPassword) => _password = newPassword!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _isObscure = !_isObscure;
                          setState(() {});
                        },
                        icon: Icon(
                          CupertinoIcons.eye_fill,
                          color: _isObscure ? Colors.grey : Colors.blue,
                        ),
                      ),
                      hintText: 'password',
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Builder(builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                        onPressed: () => _login(context),
                        child: const Text("Login")),
                  );
                }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
