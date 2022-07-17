import 'package:flutter/material.dart';

class RequestersMap extends StatefulWidget {
  const RequestersMap({ Key? key }) : super(key: key);

  @override
  State<RequestersMap> createState() => _RequestersMapState();
}

class _RequestersMapState extends State<RequestersMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Requester Map"),),
      
    );
  }
}