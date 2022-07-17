
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/donorsList.dart';
// import 'package:loginuicolors/allrequest_pages/homepage.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/donor/donorsInfoList.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/donor/donorsMap.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

// custom variables
String name = "Loading...";
String bloodgroup = "Loading...";
String gender = "Loading...";
String email = "Loading...";
// String phoneNumber = "Loading";
String phoneNumber = "888888";
double userlatitude = 0;
double userlongitude = 0;

class _DonatePageState extends State<DonatePage> {
  // custom function
  // #1
  getUsersInfo() async {
    User? currentUser = await FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('Register');
    var docSnapshot = await collection.doc(currentUser!.email).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['Name'];
      bloodgroup = data['Blood Group'];
      gender = data['Gender'];
      email = data['Email'];
      phoneNumber = data['Phone Number'];
      setState(() {});
    }
  }

  // #2
  storeInfoToDonors() async {
    await FirebaseFirestore.instance
        .collection('Donors')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({
      'Name': name,
      'Blood Group': bloodgroup,
      'Gender': gender,
      'Phone Number': phoneNumber,
      'Email': email,

      // Geolocation:
      'Location': GeoPoint(userlatitude, userlongitude)
    });
  }

  // #3
  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) {
  //     print("error: " + error.toString());
  //   });
  //   return await Geolocator.getCurrentPosition();
  // }

  // #4
  // saveUserLocationOnDB() async {
  //   getUserCurrentLocation().then((value) async {
  //     userlatitude = value.latitude;
  //     userlongitude = value.longitude;

  //     await FirebaseFirestore.instance
  //         .collection('Donors_Map')
  //         .doc(FirebaseAuth.instance.currentUser!.email)
  //         .set({
  //       'Latitude': userlatitude,
  //       'Longitude': userlongitude,
  //     });
  //   });
  // }

  // custom variables
  int _selectedIndex = 0;
  // custom functions
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    DonorsInfoListPage(),
    // DonorsMap() // Home__page(), // DonateMap(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUsersInfo();
    setState(() {});
    storeInfoToDonors();
    setState(() {});
    // saveUserLocationOnDB();
    setState(() {});
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bloodtype_outlined), label: 'Donors List'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on), label: 'Donors Locations'),
            ]),
      ),
    );
  }
}
