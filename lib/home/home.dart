import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakta_blood_donation/donate/mainDonatePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Custom Functions

  // 0. Function to get
  //    user's current location
  late GeoPoint userCurrentLocation;
  late Position userCurrentLocation_latitude;
  late Position userCurrentLocation_longitude;
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error: " + error.toString());
    });
    return (await Geolocator.getCurrentPosition());
  }

  //1. custom card function
  Card makeDashBoardItems(String title, String img, int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(3.0, -1.0),
              colors: [
                // Color.fromARGB(255, 225, 79, 123),
                Colors.redAccent,
                Color(0xFFFFFFFF),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 3,
                offset: Offset(2, 2),
              )
            ]),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              //1. PROFILE
              // Navigator.pushNamed(context, "/profile");

              // 1.2
              // Navigator.pushNamed(context, "/profile");
              Navigator.pushNamed(context, "/profile2");
            }

            if (index == 1) {
              //2. Notification
              // Navigator.pushNamed(
              //     context, '/notificationList');
              Navigator.pushNamed(context, "/notificationMain");
            }

            if (index == 2) {
              //3. Request Blood

              // First fetching the Requester's Location and saving it to the database
              getUserCurrentLocation().then((value) async {
                // value has the coordinates of the users
                // var name;
                // var email;
                // var phonenumber;
                // var address;
                // var bloodgroup;
                // var gender;

                // await FirebaseFirestore.instance.collection('Register').doc('${FirebaseAuth.instance.currentUser!.email}').get()
                // .then((snapshot) => snapshot.docs.for);
                String? currentUserEmail =
                    await FirebaseAuth.instance.currentUser!.email;
                var req_name;
                var req_age;
                var req_bloodgroup;
                var req_email;
                var req_gender;
                var req_address;
                
                FirebaseFirestore.instance
                    // .collection('page_userInfo')
                    .collection('Register')
                    .get()
                    .then((snapshot) => snapshot.docs.forEach((document) {
                          if (document['Email'] ==
                              (FirebaseAuth.instance.currentUser!.email)) {
                            req_name = document['Name'];
                            req_bloodgroup = document['Blood Group'];
                            req_age =
                                num.parse(document['Age']); //document['Age'];
                            req_email = document['Email'];
                            req_gender = document['Gender'];
                            req_address = document['City Town'];
                          }
                        }));

                await FirebaseFirestore.instance
                    .collection('Requesters')
                    .doc('${FirebaseAuth.instance.currentUser!.email}')
                    .set({
                  'Name': '$req_name',
                  'Email': '${FirebaseAuth.instance.currentUser!.email}',
                  'Blood Group': '$req_bloodgroup',
                  'Gender': '$req_gender',
                  'Address': '$req_address',
                  'Location': GeoPoint(value.latitude, value.longitude),
                });
              });

              // Navigating to the `donor01_list.dart` file
              Navigator.pushNamed(context, '/donor01_list');

              //activating function on `Donate Blood` click
              // donateBloodFunc_popupDialog();
              // show_bloodDonateConfimationDialog(context);
            }
            if (index == 3) {
              //4. Donate Blood
              // Navigator.pushNamed(context, "/exp_bloodRequest");
              // show_bloodRequestConfimationDialog(context);
              show_bloodRequestConfimationDialog_2(context);
            }
            if (index == 4) {
              // 5. Emergency Help
              Navigator.pushNamed(context, '/emergencyNeedHelp');
            }
            if (index == 5) {
              //6. Logout
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/login");
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //2. blood donation popup dialog
  donateBloodFunc_popupDialog() {
    showDialog(
        // barrierColor: Color.fromARGB(255, 244, 174, 153),
        context: context,
        builder: (context) {
          return Dialog(
            // insetPadding: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side: BorderSide(width: 40)
            ),
            elevation: 16,
            child: Container(
              // margin: EdgeInsets.only(
              //   left: 20,
              // ),
              // top: MediaQuery.of(context).size.height * 0.5),
              color: Color.fromARGB(
                  255, 244, 174, 153), //Color.fromARGB(255, 244, 78, 44),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // SizedBox(height: 20),
                  Center(
                      child: Text(
                    'Do you really want to Donate Blood?',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 2, 37, 52),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {
                          print('hello');
                        },
                        icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        });
  }

  // #3. Comes up when the user wants to donate blood
  show_bloodDonateConfimationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        Navigator.pop(context);
        // #2
        Navigator.pushNamed(context, '/donor01_list');
        // **********************************************
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you really want to donate blood?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // #5. Popup on CLICKING "DONATE BLOOD"
  show_bloodRequestConfimationDialog_2(context) {
    // getting the information from the Register Database
    late String name;
    late String bloodGroup;
    late String email;
    late String phoneNumber;
    late String address;
    late String gender;
    // Geopoint location

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        // showing the snack bar
        const snackBar = SnackBar(
          content: Text('Now you are a donor!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);

        // Geolocation Code: Code to get the user's current location
        // and saving it to the `Donors` Collection Firebase
        final Completer<GoogleMapController> _controller = Completer();

        String? currentUserEmail =
            await FirebaseAuth.instance.currentUser!.email;

        getUserCurrentLocation().then((value) async {
          print("User's current location: \n");
          print(value.latitude.toString() + ", " + value.longitude.toString());

          // await Firebaes
          // GETTING THE DATA FROM THE 'REGISTER' COLLECTION .Firestore
          await FirebaseFirestore.instance
              .collection('Register')
              .get()
              .then((snapshot) => snapshot.docs.forEach((document) {
                    if (document['Email'] ==
                        (FirebaseAuth.instance.currentUser!.email)) {
                      name = document['Name'];
                      bloodgroup = document['Blood Group'];
                      email = document['Email'];
                      gender = document['Gender'];
                      address = document['City Town'];
                      phoneNumber = document['Phone Number'];
                      address = document['City Town'];
                    }
                  }));

          // Code That will save the user's info on the Donate Database
          await FirebaseFirestore.instance
              .collection('Donors')
              .doc('${FirebaseAuth.instance.currentUser!.email}')
              .set({
            'Name': name,
            'Blood Group': bloodgroup,
            'Email': email,
            'Gender': gender,
            'Phone Number': phoneNumber,
            'Address': address,
            // GeoLocation Point
            'Location': GeoPoint(value.latitude, value.longitude),
          });
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you really want to donate blood?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "RAKTA",
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
        backgroundColor: Colors.redAccent,
      ),

      // drawer: NavBar(),

      //not sure whether we will use this or not.
      // drawer: Drawer(),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/blood_background/img2.PNG'),
              // image: AssetImage('assets/blood_background/img3.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                //index 0
                makeDashBoardItems(
                    // "Calender", "assets/thirdParty/calendar.png", 0),
                    "Profile",
                    "assets/images/pImg.png",
                    0),
                //index 1
                makeDashBoardItems(
                    // "Festival", "assets/thirdParty/festival.png", 1),
                    // "assets/thirdParty/map.png",
                    "Notifications",
                    "assets/thirdParty/notification3.png",
                    // "assets/thirdParty/notification2.jpg",
                    1),
                //index 2
                makeDashBoardItems(
                    // "Donate Blood", "assets/images/blood_donateLogo128.png", 2),
                    "Request Blood",
                    "assets/images/blood_donateLogo128.png",
                    2),
                //index 3
                makeDashBoardItems("Donate Blood",
                    "assets/images/blood_requestImg2_128.png", 3),
                //index 4
                //NOT sure what logo should we put
                makeDashBoardItems(
                    "Emergency Help",
                    // "assets/thirdParty/todo.png",
                    "assets/images/emergency2.jpg",
                    4), //NOTE: @have to change ->> 'On clicking this button the the user will be set on the 'Donors' collection.!! HAVE TO CHANGE'
                //index 5
                makeDashBoardItems(
                    "Logout", "assets/images/logoutLogo128.png", 5),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
