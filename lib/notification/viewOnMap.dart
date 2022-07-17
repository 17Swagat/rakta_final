import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'acceptedNotification.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewOnMap extends StatefulWidget {
  final String name;
  final String email;
  final GeoPoint userPosition;
  // const ViewOnMap({Key? key}) : super(key: key);
  const ViewOnMap(this.name, this.email,this.userPosition);

  @override
  State<ViewOnMap> createState() => _ViewOnMapState();
}

class _ViewOnMapState extends State<ViewOnMap> {

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
    FirebaseFirestore.instance.collection('Donors').where('Email', isEqualTo: widget.email).get().then((mydata) {
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
      appBar: AppBar(
        title: Text("Donor on Map"),
        backgroundColor: Colors.redAccent,
      ),    
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}