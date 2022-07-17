import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

class AB_negativeDonors_Map extends StatefulWidget {
  const AB_negativeDonors_Map({Key? key}) : super(key: key);

  @override
  State<AB_negativeDonors_Map> createState() => _AB_negativeDonors_MapState();
}

class _AB_negativeDonors_MapState extends State<AB_negativeDonors_Map> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold();
  // }
  late GoogleMapController myController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['Location'].latitude, specify['Location'].longitude),
      infoWindow: InfoWindow(
        title: 'Blood Group: ${specify['Blood Group']}', 
        snippet: specify['Name']
      ),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    FirebaseFirestore.instance.collection('Donors').where('Blood Group', isEqualTo: 'ab-').get().then((mydata) {
      if (mydata.docs.isNotEmpty) {
        for (int i = 0; i < mydata.docs.length; i++) {
          initMarker(mydata.docs[i].data(), mydata.docs[i].id);
        }
      }
    });
  }

  void initState() {
    getMarkerData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GoogleMap(
      //   initialCameraPosition: _kGooglePlex,
      //   // compassEnabled: true,
      //   myLocationEnabled: true,
      //   markers: Set<Marker>.of(_marker),
      //   mapType: MapType.hybrid,
      //   onMapCreated: (GoogleMapController controller) {
      //     _controller.complete(controller);
      //   },
      // ),
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(target: LatLng(27.4728, 94.9120), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}