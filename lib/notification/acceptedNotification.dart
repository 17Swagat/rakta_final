// import 'dart:html';
  
import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/notification/viewOnMap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_sms/flutter_sms.dart';

late GeoPoint postion;

class AcceptedNotifcations extends StatefulWidget {
  const AcceptedNotifcations({Key? key}) : super(key: key);

  @override
  State<AcceptedNotifcations> createState() => _AcceptedNotifcationsState();
}

class _AcceptedNotifcationsState extends State<AcceptedNotifcations> {
  // function to send sms
  // void sending_SMS(String msg, List<String> list_receipents) async {
  //   String send_result =
  //       await sendSMS(message: msg, recipients: list_receipents)
  //           .catchError((err) {
  //     print(err);
  //   });
  //   print(send_result);
  // }

  // popupcode
  showPopup_onReport() {
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

        const snackBar = SnackBar(
          content: Text('Your Report has been sent to us!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // @Reccomandation
        // Or we can save it on the database
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you really want to report this user?"),
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
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Accepted Blood Requests"),
      ),
      body: Container(
        decoration: BoxDecoration(
          // image: jo//AssetImage('assets/blood_background/img5.jpg')
          image: DecorationImage(
            // image: AssetImage('assets/blood_background/img5.jpg'),
            image: AssetImage('assets/blood_background/notification.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('BloodRequestAccepted')
              .doc('${FirebaseAuth.instance.currentUser!.email}')
              .collection('Accepted People')
              .snapshots(),
          // stream: FirebaseFirestore.instance.collection('Notify Donate').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  // itemBuilder: (context, index) => Container(
                  itemBuilder: (context, index) {
                    String notification_text = "";
                    // if (snapshot.data!.docs[index].id ==
                    //     "${FirebaseAuth.instance.currentUser!.email}") {
                    //   notification_text =
                    //       "${snapshot.data!.docs[index]['Accepted People']} has accepted your request";
                    // } else {
                    //   notification_text =
                    //       "You have accepted blood request from ${snapshot.data!.docs[index].id}";
                    // }
                    notification_text = "Blood Request Accepted : ${snapshot.data!.docs[index].id}";
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width - 30, //300,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                border: Border.all(
                                    color: Color.fromARGB(255, 237, 135, 135),
                                    width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Text(
                                  // "Your request has been accepted by  ${snapshot.data!.docs[index].id}",
                                  // "Blood Request Accepted Between: ${snapshot.data!.docs[index].id} & ${FirebaseAuth.instance.currentUser!.email}",
                                  // "${(snapshot.data!.docs[index] != "useremailjj") ? "x": "x"}",
                                  "$notification_text",

                                  // "Blood Request has been accepted between ${snapshot.data!.docs[index].id} and ${FirebaseAuth.instance.currentUser!.email}",
                                  // "You accepted Blood Request from:  ${snapshot.data!.docs[index].id}",
                                  style: TextStyle(
                                      fontSize: 20, //40
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 117, 59, 59)),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  child: Text(
                                      "SMS ${snapshot.data!.docs[index].id}"),
                                  onPressed: () async {
                                    // #1
                                    //
                                    /*
                               List<String> phoneNumber = [];

                               FirebaseFirestore.instance.collection('Register').get().then((user) => user.docs.forEach((document) {
                                // if (document['Email'] == '${snapshot.data!.docs[index].id}') {
                                if ('${snapshot.data!.docs[index].id}' == document['Email']) {
                                  phoneNumber.add(document['Phone Number']);
                                  sendSMS(message: "Message between rakta users", recipients: phoneNumber);
                                } 
                                else {
                                  const snackBar = SnackBar(
                                    content: Text('SMS NOT OPENING!'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                
                                }
                                }));
                                */

                                    // #2

                                    List<String> phoneNumber = [];

                                    await FirebaseFirestore.instance
                                        .collection('Register')
                                        .get()
                                        .then((user) =>
                                            user.docs.forEach((document) {
                                              if ("${snapshot.data!.docs[index].id}" ==
                                                  document['Email']) {
                                                phoneNumber.add(
                                                    document['Phone Number']);

                                                // sending_SMS("@RAKTA: Sending Message: ", phoneNumber);
                                                // sendSMS(message: "@RAKTA:", recipients: phoneNumber);

                                                // url_launcher (sms stuff)
                                                // launchSms('sms: ');
                                                launch(
                                                    'sms:+91${phoneNumber[0]}?body=rakta I need an urgent help from you.'); //RAKTA :\nI need an urgent help from you...');
                                                // launchSms("RAKTA", phoneNumber);
                                                // launchSms();
                                              } else {
                                                // const snackBar = SnackBar(
                                                //   content: Text('SMS App NOT OPENING!'),
                                                // );
                                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }
                                            }));
                                  },
                                ),
                                ElevatedButton(
                                  child: Text(
                                      "Report ${snapshot.data!.docs[index].id}"),
                                  onPressed: () async {
                                    // #1 (SOMEWHAT FAILED)
                                    // CollectionReference userCollection = await FirebaseFirestore.instance.collection('Reported Users');
                                    // print("Reported User ${snapshot.data!.docs[index].id}");
                                    // userCollection.doc('${snapshot.data!.docs[index].id}').update({
                                    //   // We will impose a condition that
                                    //   // if the user has been reported more than by more than 3 people than his account will be terminated
                                    //   'Reported Times': FieldValue.increment(1),
                                    //   // 'Situation': ''//"temporarily suspended", "account termination"
                                    // });

                                    // POP-up
                                    showPopup_onReport();

                                    // #2 (REPORTED USER) :-> Storing the info on the database
                                    await FirebaseFirestore.instance
                                        .collection('Reports')
                                        .doc('${snapshot.data!.docs[index].id}')
                                        .collection('Reported by')
                                        .doc(
                                            '${FirebaseAuth.instance.currentUser!.email}')
                                        .set({
                                      'Reported by':
                                          '${FirebaseAuth.instance.currentUser!.email}'
                                    });

                                    // await FirebaseFirestore.instance.collection('Reported Users').doc('${snapshot.data!.docs[index].id}').set({
                                    //   // We will impose a condition that
                                    //   // if the user has been reported more than by more than 3 people than his account will be terminated
                                    //   'Reported Times': FieldValue.increment(1),
                                    //   'Account State': '()'
                                    // });
                                  },
                                ),
                                ElevatedButton(
                                  child: Text(
                                      "View ${snapshot.data!.docs[index].id} on MAP"),
                                  onPressed: () async {
                                    //getting the User's Location LatLng from the database

                                    // GeoPoint postion;
                                    FirebaseFirestore.instance
                                        // .collection('page_userInfo')
                                        .collection('Donors')
                                        .where('Email',
                                            isEqualTo:
                                                '${snapshot.data!.docs[index].id}')
                                        .get()
                                        .then((snapshot) =>
                                            snapshot.docs.forEach((document) {
                                              // if (document['Email'] ==
                                              // (FirebaseAuth.instance.currentUser!.email)) {
                                              // if (){
                                              // name = document['Name'];
                                              // bloodgroup = document['Blood Group'];
                                              // age = num.parse(document['Age']); //document['Age'];
                                              // email = document['Email'];
                                              // gender = document['Gender'];
                                              // address = document['City Town'];
                                              // }
                                              postion = document['Location'];
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewOnMap(
                                                              document['Name'],
                                                              document['Email'],
                                                              postion)));
                                            }));
                                    // Navigator.pushNamed(context, "/viewOnMap");
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserData("WonderClientName",132)));
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ); //,
                  });
            } else {
              return Container(
                  // color: Colors.red,
                  );
            }
          },
        ),
      ),
    );
  }
}
