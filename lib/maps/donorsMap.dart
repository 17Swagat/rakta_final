import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DonorsMap extends StatefulWidget {
  const DonorsMap({ Key? key }) : super(key: key);

  @override
  State<DonorsMap> createState() => _DonorsMapState();
}

class _DonorsMapState extends State<DonorsMap> {

  // stuff 1

  Completer<GoogleMapController> _controller = Completer();

  // stuff 2

  // initial position (@temporary)
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(27.472834, 94.911964),
    zoom: 14
  );

  // stuff 3

  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(27.472834, 94.911964),
      infoWindow: InfoWindow(
        title: 'Blood Group: X+',
        snippet: 'Name Of the Person',
      )
    ),
  ];

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        // compassEnabled: true,
        myLocationEnabled: true,
        markers: Set<Marker>.of(_marker),
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}