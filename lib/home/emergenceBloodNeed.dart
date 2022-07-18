import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmergencyNeedBlood extends StatefulWidget {
  const EmergencyNeedBlood({Key? key}) : super(key: key);

  @override
  State<EmergencyNeedBlood> createState() => _EmergencyNeedBloodState();
}

class _EmergencyNeedBloodState extends State<EmergencyNeedBlood> {
  // function to send notificatino to all
  sendNotifToAll(String bloodGroup) async {
    String? currentUserEmail = await FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore.instance
        .collection('Donors')
        .where('Blood Group',
            whereIn: ['${bloodGroup.toLowerCase()}', '${bloodGroup.toUpperCase()}'])
        // isEqualTo: '${bloodGroup.toUpperCase()}')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) async {
              await FirebaseFirestore.instance
                  .collection('Notify Donate')
                  .doc('${document.id}')
                  .collection('Requests')
                  .doc('${await FirebaseAuth.instance.currentUser!.email}')
                  .set({
                'To': '${document.id}',
                'From': '${await FirebaseAuth.instance.currentUser!.email}'
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMERGENCY HELP"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            // image: AssetImage('assets/blood_background/img2.PNG'),
            image: AssetImage('assets/blood_background/img5.jpg'),
            // image: AssetImage('assets/images/register.png'),
            // image: AssetImage('assets/images/bloodimg1.jpg'),
            fit: BoxFit.cover,
          )),
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "Which blood group you urgently want?",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // width: double.infinity,
                    width: MediaQuery.of(context).size.width - 100,
                    child: ElevatedButton(
                      onPressed: () async {
                        sendNotifToAll('a+');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the A+ donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("A+ BLOOD GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.redAccent,
                        primary: Colors.red,
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
                      onPressed: () async {
                        sendNotifToAll('a-');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the A- donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("A- BLOOD GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
                      onPressed: () async {
                        sendNotifToAll('b+');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the B+ donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("B+ BLOOD GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold
                      // ),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
                      onPressed: () async {
                        sendNotifToAll('b-');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the B- donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("B- BLOOD GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 20
                      // )
                      // ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
                      // onPressed: () {},
                      onPressed: () async {
                        sendNotifToAll('o+');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the O+ donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("O+ BLOOD GROUP",
                          // style: TextStyle(
                          //   fontWeight: FontWeight.bold)
                          // ),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
                      onPressed: () async {
                        sendNotifToAll('o-');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the O- donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("O- BLOOD GROUP",
                          // style: TextStyle(
                          //   fontWeight: FontWeight.bold)
                          // ),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
                      onPressed: () async {
                        sendNotifToAll('ab+');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the AB+ donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("AB+ BLOOD GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold)
                      // ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
                      // onPressed: () {},
                      onPressed: () async {
                        sendNotifToAll('ab-');
                        const snackBar = SnackBar(
                          content: Text(
                              'Your blood request has been sent to all the AB- donors!!'),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("AB- BLOOD GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold)
                      // ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
      ),
    );
  }
}
