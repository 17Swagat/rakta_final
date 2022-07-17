import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/bn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/bp_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/op_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/op.dart';

class B_negativeMain extends StatefulWidget {
  const B_negativeMain({Key? key}) : super(key: key);

  @override
  State<B_negativeMain> createState() => _B_negativeMainState();
}

class _B_negativeMainState extends State<B_negativeMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B- Donors"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          // backgroundBlendMode: 
          image: DecorationImage(
            // image: AssetImage('assets/blood_background/img1.PNG'),
            image: AssetImage('assets/blood_background/img5.jpg'),
            fit: BoxFit.cover,
          )
        ),
        padding: EdgeInsets.fromLTRB(0, 
        (MediaQuery.of(context).size.height)/3,// 300, 200, 
        0, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/bn_list");
                }, child: Text("B- Donors List"),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.redAccent
                  primary: Colors.redAccent,
                  // onPrimary:  Colors.redAccent,
                ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/bn_list_map_donors");
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.redAccent
                  primary: Colors.redAccent,
                  // onPrimary:  Colors.redAccent,
                ),
                 child: Text("B- Donors Location")),
              )
            ],
          ),
        )
      ),
    );
  }
}