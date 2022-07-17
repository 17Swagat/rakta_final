
import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/bp.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/bp_maps.dart';

class B_positiveMain extends StatefulWidget {
  const B_positiveMain({Key? key}) : super(key: key);

  @override
  State<B_positiveMain> createState() => _B_positiveMainState();
}

class _B_positiveMainState extends State<B_positiveMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B+ Donors"),
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
        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/3, 0, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/bp_list");
                }, child: Text("B+ Donors List"),
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
                  Navigator.pushNamed(context, "/bp_list_map_donors");
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.redAccent
                  primary: Colors.redAccent,
                  // onPrimary:  Colors.redAccent,
                ),
                 child: Text("B+ Donors Location")),
              )
            ],
          ),
        )
      ),
    );
  }


}