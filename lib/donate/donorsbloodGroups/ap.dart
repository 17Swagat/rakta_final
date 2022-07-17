import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class A_PositiveList extends StatefulWidget {
  const A_PositiveList({ Key? key }) : super(key: key);

  @override
  State<A_PositiveList> createState() => _A_PositiveListState();
}

class _A_PositiveListState extends State<A_PositiveList> {

  // code to get the address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A+ Donors"),
        backgroundColor: Colors.redAccent,
      ),      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/blood_background/img5.jpg'),
            fit: BoxFit.cover,)
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Donors')
          // .where('Blood Group', isEqualTo: 'a+').snapshots(),
          .where('Blood Group', whereIn: ['a+', 'A+']).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {

              // getting the address from the Register
              String address = "";

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                // #1 (WORKED)
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        // color: Colors.deepPurple[100],//[100],
                        // height: 200,//MediaQuery. of(context). size. height,//50,
                        width: MediaQuery.of(context).size.width - 30, //300,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            border: Border.all(
                                color: Color.fromARGB(255, 237, 135, 135),
                                width: 5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text(
                              "Name: ${snapshot.data!.docs[index]['Name']}\nBlood Group: ${snapshot.data!.docs[index]['Blood Group']}\nGender: ${snapshot.data!.docs[index]['Gender']}\nMobile Number: ${snapshot.data!.docs[index]['Phone Number']}\nAddress:${snapshot.data!.docs[index]['Address']} ",
                              // TokenId: ${snapshot.data!.docs[index]['tokenId']}",
                              style: TextStyle(
                                fontSize: 20, //40
                              ),
                            ),
                            ElevatedButton(
                              child: Text(
                                  "Request Blood from ${snapshot.data!.docs[index]['Email']}"), //Name/Email
                              onPressed: () async {
                                // #0
                                print(
                                    "Hello ${snapshot.data!.docs[index]['Email']} STARTTT");
                                
                                // #1.2
                                await FirebaseFirestore.instance
                                    .collection('Notify Donate')
                                    // .doc('x')//'${snapshot.data!.docs[index]['Email']}')
                                    .doc(
                                        // '${await FirebaseAuth.instance.currentUser!.email}')
                                        '${snapshot.data!.docs[index]['Email']}'
                                      )
                                      .collection('Requests')
                                        .doc('${await FirebaseAuth.instance.currentUser!.email}')
                                    .set({
                                      'To': '${snapshot.data!.docs[index]['Email']}',
                                      'From': '${await FirebaseAuth.instance.currentUser!.email}'
                                    }
                                    );
  const snackBar = SnackBar(
    content: Text('Request Sent!'),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);                                

                                print(
                                    "Hello ${snapshot.data!.docs[index]['Email']} ENDDDDD");
                                // #1
                                //code that sends the notification
                                //   sendNotification(
                                //       [snapshot.data!.docs[index]['tokenId']],
                                //       "Blood Request from __",
                                //       "Rakta Notification");

                                // #2
                                // print("Hello World Testing");
                                /*
                                      sendNotification(
                                          snapshot.data!.docs[index]['tokenId'],
                                          "Blood Request From _",
                                          "Rakta Notification");
                                      */

                                // #3
                                // await FirebaseFirestore.instance
                                //     .collection('register')
                                //     .doc('$storeEmail')
                                //     .collection('notifications')
                                //     .add({
                                //       'bloodRequest': 'From : ${await FirebaseAuth.instance.currentUser!.email}',
                                //     });
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );

            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}