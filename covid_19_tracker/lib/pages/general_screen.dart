import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {
  final Widget content;

  const GeneralScreen({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Covid-19 Tracker',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'DynaPuff', //TSalvacion

            letterSpacing: 3.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
    );
  }
}
