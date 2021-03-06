import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abp.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abp_maps.dart';

class AB_positiveMain extends StatefulWidget {
  const AB_positiveMain({Key? key}) : super(key: key);

  @override
  State<AB_positiveMain> createState() => _AB_positiveMainState();
}

class _AB_positiveMainState extends State<AB_positiveMain> {

  // int _selectedIndex = 0;
  // // custom functions
  // void _navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // final List<Widget> _pages = [
  //   AB_PostiveList(),
  //   AB_postiveDonors_Map(),
  // ];

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   setState(() {
      
  //   });
  //   return Scaffold(
  //     body: _pages[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //           type: BottomNavigationBarType.fixed,
  //           currentIndex: _selectedIndex,
  //           onTap: _navigateBottomBar,
  //           items: [
  //             BottomNavigationBarItem(
  //                 icon: Icon(Icons.bloodtype_outlined), label: 'Donors List'),
  //             BottomNavigationBarItem(
  //                 icon: Icon(Icons.location_on), label: 'Donors Locations'),
  //           ]),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AB+ Donors"),
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
                  Navigator.pushNamed(context, "/abp_list");
                }, child: Text("AB+ Donors List"),
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
                  Navigator.pushNamed(context, "/abp_list_map_donors");
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.redAccent
                  primary: Colors.redAccent,
                  // onPrimary:  Colors.redAccent,
                ),
                 child: Text("AB+ Donors Location")),
              )
            ],
          ),
        )
      ),
    );
  }

}