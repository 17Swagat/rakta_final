import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/on_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/on.dart';

class O_negativeMain extends StatefulWidget {
  const O_negativeMain({Key? key}) : super(key: key);

  @override
  State<O_negativeMain> createState() => _O_negativeMainState();
}

class _O_negativeMainState extends State<O_negativeMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O- Donors"),
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
        padding: EdgeInsets.fromLTRB(
          0, 
          (MediaQuery.of(context).size.height)/3,// 300, 
          0, 
        0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/on_list");
                }, child: Text("O- Donors List"),
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
                  Navigator.pushNamed(context, "/on_list_map_donors");
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.redAccent
                  primary: Colors.redAccent,
                  // onPrimary:  Colors.redAccent,
                ),
                 child: Text("O- Donors Location")),
              )
            ],
          ),
        )
      ),
    );
  }

}