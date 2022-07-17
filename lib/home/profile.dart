// WORKING

// CONSIDERING THE FACT THAT EVERY PERSON ON THE APP HAS A UNIQUE EMAIL

// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
// import 'package:loginuicolors/getUserinfo.dart';
// import 'package:loginuicolors/navbar.dart';
import 'dart:async';

/*
Global Variables for Firebase code to get the user data and display
*/
// Name
// Blood Group
// Gender
// Age
// Email

// final userRef = FirebaseFirestore.instance.collection('page_userInfo');
String name = "Loading...";
String bloodgroup = "Loading...";
num age = 0;
String email = "Loading...";
String gender = "Loading...";
String address = "Loading...";

class Exp_ProfilePage extends StatefulWidget {
  const Exp_ProfilePage({Key? key}) : super(key: key);

  @override
  State<Exp_ProfilePage> createState() => _Exp_ProfilePageState();
}

class _Exp_ProfilePageState extends State<Exp_ProfilePage> {

  getUserData() async {
    // FirebaseAuth
    String? currentUserEmail = await FirebaseAuth.instance.currentUser!.email;

    // Firestore
    // await 
    FirebaseFirestore.instance
        // .collection('page_userInfo')
        .collection('Register')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              if (document['Email'] ==
                  (FirebaseAuth.instance.currentUser!.email)) {
                name = document['Name'];
                bloodgroup = document['Blood Group'];
                age = num.parse(document['Age']); //document['Age'];
                email = document['Email'];
                gender = document['Gender'];
                address = document['City Town'];
              }
            }));
  }

 @override
  void initState() {
    // getUserById();
    getUserData();
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // getUserById();

    // FirebaseAuth.instance.

    getUserData();
    setState(() {});
    getUserData();
    setState(() {});

    return Scaffold(
        backgroundColor: Colors.white,//Colors.deepPurple[100],
        appBar: AppBar(
          title: Text("PROFILE"),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/blood_background/img7.jpeg'),
              fit: BoxFit.cover
              ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   shape: BoxShape.circle
                        // ),
                        height: 80,//120,
                        color: Colors.redAccent, //Colors.deepPurple[300],
                        child: Center(
                            child: Text(
                          'NAME: $name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25, //30,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 80,//120,
                        // height: 120,
                        color: Colors.redAccent, //Colors.deepPurple[300],
                        child: Center(
                            child: Text(
                          'BLOOD GROUP: $bloodgroup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 80,//120,
                        // height: 120,
                        color: Colors.redAccent, //Colors.deepPurple[300],
                        child: Center(
                            child: Text(
                          'GENDER: $gender',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 80,//120,
                        // height: 120,
                        color: Colors.redAccent, //Colors.deepPurple[300],
                        child: Center(
                            child: Text(
                          'AGE: $age',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        // height: 120,
                        height: 80,//120,
                        color: Colors.redAccent, //Colors.deepPurple[300],
                        child: Center(
                            child: Text(
                          'ADDRESS: $address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
