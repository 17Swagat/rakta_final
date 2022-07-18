import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'acceptedNotification.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewOnMap extends StatefulWidget {
  final String name;
  final String email;
  final GeoPoint userPosition;
  // const ViewOnMap({Key? key}) : super(key: key);
  const ViewOnMap(this.name, this.email, this.userPosition);

  @override
  State<ViewOnMap> createState() => _ViewOnMapState();
}

class _ViewOnMapState extends State<ViewOnMap> {
  late GoogleMapController myController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // GoogleMapPolyline googleMapPolyline =
  //     new GoogleMapPolyline(apiKey: "AIzaSyBw_PRFe-6ZHzCvxEo21wCLYpb0pTv4kGg");

  final Set<Polyline> _polyline = {};
  List<LatLng> latlng = [];
  // List<LatLng>? latlng2;

  void initMarker(specify, specifyId) async {
    latlng.add(
        LatLng(specify['Location'].latitude, specify['Location'].longitude));

    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['Location'].latitude, specify['Location'].longitude),
      infoWindow: InfoWindow(
          title: 'Blood Group: ${specify['Blood Group']}',
          snippet: specify['Name']),
    );
    setState(() {
      markers[markerId] = marker;
    });

    // _polyline.add(
    //   Polyline(
    //     polylineId: PolylineId('PolylineId_$specifyId'),
    //     points: latlng,
    //     color: Colors.orange
    //   ),
    // );
  }

  getMarkerData() async {
    FirebaseFirestore.instance
        .collection('Donors')
        // .where('Email', isEqualTo: widget.email)
        .where('Email', whereIn: [
          widget.email,
          '${FirebaseAuth.instance.currentUser!.email}'
        ])
        .get()
        .then((mydata) async {
          if (mydata.docs.isNotEmpty) {
            for (int i = 0; i < mydata.docs.length; i++) {
              initMarker(mydata.docs[i].data(), mydata.docs[i].id);

              _polyline.add(
                Polyline(
                    polylineId: PolylineId('PolylineId_${mydata.docs[i].id}'),
                    points: latlng,
                    width: 5,
                    patterns: [
                      PatternItem.dash(8),
                      PatternItem.gap(15),
                    ],
                    color: Colors.redAccent),
              );
            }
          }
        });

    FirebaseFirestore.instance
        .collection('Requesters')
        .where('Email', whereIn: [
          widget.email,
          '${FirebaseAuth.instance.currentUser!.email}'
        ])
        .get()
        .then((mydata) async{
          if (mydata.docs.isNotEmpty) {
            for (int i = 0; i < mydata.docs.length; i++) {
              initMarker(mydata.docs[i].data(), mydata.docs[i].id);

              _polyline.add(
                Polyline(
                    polylineId: PolylineId('PolylineId_${mydata.docs[i].id}'),
                    points: latlng,
                    width: 5,
                    patterns: [
                      PatternItem.dash(8),
                      PatternItem.gap(15),
                    ],
                    color: Colors.redAccent),
              );
            }
          }

        });
  }

  @override
  void initState() {
    getMarkerData();
    super.initState();
    // xxx
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
        polylines: _polyline,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              widget.userPosition.latitude, widget.userPosition.longitude),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
