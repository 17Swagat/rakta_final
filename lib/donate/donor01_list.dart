import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:geolocator/geolocator.dart';


class Donor01_List extends StatefulWidget {
  const Donor01_List({Key? key}) : super(key: key);

  @override
  State<Donor01_List> createState() => _Donor01_ListState();
}

class _Donor01_ListState extends State<Donor01_List> {
/*
  //function to get User's current location
  // late Position userCurrentPosition;

  // Future<Position>
  getUserLocation () async{
    bool serviceEnabled;
    // locationpermission permission;

    // serviceenabled = await geolocator.islocationserviceenabled();
    if (!serviceEnabled) {
      final text = "Please keep your location on";
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        final text = "User Denied the Location Permission";
        final snackBar = SnackBar(content: Text(text));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      final text = "User Denied the Location Permission Forever!!";
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    try{
      await FirebaseFirestore.instance.collection('Donors').doc('${await FirebaseAuth.instance.currentUser!.email}').update({
        'Location': GeoPoint(position.latitude, position.longitude),
      });
     
    } catch(e) {
      print(e.toString());
    }

    setState(() {
      
    });
  }


*/
  @override
  Widget build(BuildContext context) {
    // getUserLocation();
    // setState(() {
    //   getUserLocation();
    // });
    // getUserLocation();
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromARGB(255, 177, 223, 246),
      // backgroundColor: Color.fromARGB(255, 56, 229, 255),
      appBar: AppBar(
        title: Text("Blood Group"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            // image: AssetImage('assets/blood_background/img2.PNG'),
            image: AssetImage('assets/blood_background/img5.jpg'),
            fit: BoxFit.cover,
          ) 
          ),
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/ap_list");
                      Navigator.pushNamed(context, "/ap_main_donors");
                    },
                    child: Text("A+ BLOOD GROUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      // shape: OutlinedBorder(circular)
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/an_main_donors");
                
                    },
                    child: Text("A- BLOOD GROUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold)
                    // ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/bp_main_donors");
                    },
                    child: Text("B+ BLOOD GROUP", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold
                    // ),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/bn_list");
                      Navigator.pushNamed(context, "/bn_main_donors");
                    },
                    child: Text("B- BLOOD GROUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 20
                    // )
                    // ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/op_list");
                      Navigator.pushNamed(context, "/op_main_donors");

                    },
                    child: Text("O+ BLOOD GROUP",
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold)
                    // ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/on_list");
                      Navigator.pushNamed(context, "/on_main_donors");
                    },
                    child: Text("O- BLOOD GROUP",
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold)
                    // ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),

                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/abp_list");
                      Navigator.pushNamed(context, "/abp_main_donors");
                    },
                    child: Text("AB+ BLOOD GROUP", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold)
                    // ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/abn_list");
                      Navigator.pushNamed(context, "/abn_main_donors");
                    },
                    child: Text("AB- BLOOD GROUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold)
                    // ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
