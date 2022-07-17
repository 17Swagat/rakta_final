import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class A_positiveList extends StatefulWidget {
  const A_positiveList({Key? key}) : super(key: key);

  @override
  State<A_positiveList> createState() => _A_positiveListState();
}

class _A_positiveListState extends State<A_positiveList> {
  var DB_donorsCollection =
      FirebaseFirestore.instance.collection('Donors'); //.snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A+ Donors"),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
        stream: DB_donorsCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // for (int i = 0; i < snapshot.data!.docs['N'])
            return ListView.builder(
              itemBuilder: (context, index) => Container(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
