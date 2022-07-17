import 'package:flutter/material.dart';

class File2 extends StatefulWidget {
  const File2({Key? key}) : super(key: key);

  @override
  State<File2> createState() => _File2State();
}

class _File2State extends State<File2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
        "page2 testing",
      ),)
    );
  }
}