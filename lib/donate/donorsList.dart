import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/donor/searchblood.dart';
// import 'package:loginuicolors/mainCodeFiles/loginNdRegsStuff/register.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

const kAppId = 'ba5e68b5-b9fd-4249-856d-8281bd57519c';

String name = "Loading";
String bloodGroup = "Loading";
String gender = "Loading";
num phoneNumber = 9999999;
// late final String tokenId;

// var phoneNumber = "9999999";

class DonorsInfoListPage extends StatefulWidget {
  const DonorsInfoListPage({Key? key}) : super(key: key);

  @override
  State<DonorsInfoListPage> createState() => _DonorsInfoListPageState();
}

class _DonorsInfoListPageState extends State<DonorsInfoListPage> {
  // // Search (Blood search) stuff
  // TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _searchController.addListener(_onSearchChanged);
  // }

  // @override
  // void dispose() {
  //   _searchController.removeListener(_onSearchChanged);
  //   _searchController.dispose();
  //   super.dispose();
  // }

  // _onSearchChanged() {
  //   print(_searchController.text);
  // }

  // OneSignal Stuff
  // ////////////////////////////////////////////////////

  // #1

  // Future<Response> sendNotification(
  //     List<String> tokenIdList, String contents, String heading) async {
  //   return await post(
  //     Uri.parse('https://onesignal.com/api/v1/notifications'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "app_id":
  //           'ba5e68b5-b9fd-4249-856d-8281bd57519c', //kAppId is the App Id that one get from the OneSignal When the application is registered. {here it can be found in the notifications/notification1.dart}

  //       "include_player_ids":
  //           tokenIdList, //tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

  //       // android_accent_color reprsent the color of the heading text in the notifiction
  //       "android_accent_color": "FF9976D2",

  //       // "small_icon": "ic_stat_onesignal_default",

  //       "large_icon":
  //           "https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",

  //       "headings": {"en": heading},

  //       "contents": {"en": contents},
  //     }),
  //   );
  // }

  // #2
  // Future<Response> sendNotification(
  //     List<String> tokenIdList, String contents, String heading) async {
  //   return await post(
  //     Uri.parse('https://onesignal.com/api/v1/notifications'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "app_id":
  //           kAppId, //kAppId is the App Id that one get from the OneSignal When the application is registered.

  //       "include_player_ids":
  //           tokenIdList, //tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

  //       // android_accent_color reprsent the color of the heading text in the notifiction
  //       "android_accent_color": "FF9976D2",

  //       "small_icon": "ic_stat_onesignal_default",

  //       "large_icon":
  //           "https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",

  //       "headings": {"en": heading},

  //       "contents": {"en": contents},
  //     }),
  //   );
  // }

  // ////////////////////////////////////////////////////

  // addToNotificationCollection() async{

  // }

  ///////////////////////////
  ///////////////////////////
  // search box

  ///////////////////////////
  ///////////////////////////

  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Donors'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // showSearch(context: context, delegate: MySearchDelegate());
              // buildSearch();
            },
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Donors').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
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
                              "Name: ${snapshot.data!.docs[index]['Name']}\nBlood Group: ${snapshot.data!.docs[index]['Blood Group']}\nGender: ${snapshot.data!.docs[index]['Gender']}\nMobile Number: ${snapshot.data!.docs[index]['Phone Number']}\n",
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
                                
                                // #1.1 Worked but here the fetching of stored data became an obstacle
                                // await FirebaseFirestore.instance
                                //     .collection('Notification Donate')
                                //     // .doc('x')//'${snapshot.data!.docs[index]['Email']}')
                                //     .doc(
                                //         '${snapshot.data!.docs[index]['Email']}')
                                //     .update({
                                //       "Blood Requesters From": FieldValue.arrayUnion([
                                //         {
                                //           // "Email": "${snapshot.data!.docs[index]['Email']}",
                                //           // "Name": "${snapshot.data!.docs[index]['Name']}",
                                //           'Email': '${await FirebaseAuth.instance.currentUser!.email}',
                                //         },                                      
                                //       ])
                                //     });

                                // .set({
                                //   'Requester': '${await FirebaseAuth.instance.currentUser!.email}',

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

              // #2 (FAILED)
              /*itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title:
                                Text('Username: ${snapshot.data!.docs[index]['Name']}'),
                            subtitle:
                                Text('Email: ${snapshot.data!.docs[index]['Email']}; Blood Group: ${snapshot.data!.docs[index]['Blood Group']}'),
                          ),
                        ),
                      );*/

              // #3 (FAILED)
              //   itemBuilder: (context, index) => Container(
              //     child: Column(
              //       children: [
              //         // Text(
              //         //     "${snapshot.data!.docs[index]['Name']} : ${snapshot.data!.docs[index]['Blood Group']} : ${snapshot.data!.docs[index]['Gender']} : ${snapshot.data!.docs[index]['Phone Number']}"),

              //         Row (
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(bottom: 10),
              //               child: Text('${snapshot.data!.docs[index]['Name']}'),
              //             ),
              //           ],
              //         ),

              //         Row (
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(bottom: 10),
              //               child: Text('${snapshot.data!.docs[index]['Email']}'),
              //             ),
              //           ],
              //         ),

              //       ],
              //     ),
              //   ),
              // );

            } else {
              return Container();
            }
          },
        ),
      ),
    );

    // Widget buildSearch() => SearchWidget(text: query, onChanged: onChanged, hintText: hintText)
  }
}

// SearchWidget(
//   text: query,
//   hintText: 'Blood Group (in lowercase)'
//   onChanged: searchBlood,
// );


/*
class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null); //close search
      },
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear)),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'a+',
      'a-',
      'b+',
      'b-',
      'o+',
      'o-',
      'ab+',
      'ab-'
    ];

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;

              showResults(context);
            },
          );
        });
  }
}*/
