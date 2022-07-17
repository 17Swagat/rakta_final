import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/op_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/op.dart';

class O_positiveMain extends StatefulWidget {
  const O_positiveMain({Key? key}) : super(key: key);

  @override
  State<O_positiveMain> createState() => _O_positiveMainState();
}

class _O_positiveMainState extends State<O_positiveMain> {

  // int _selectedIndex = 0;
  // // custom functions
  // void _navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // final List<Widget> _pages = [
  //   O_PositiveList(),
  //   O_positiveDonors_Map(),
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
        title: Text("O+ Donors"),
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
                  Navigator.pushNamed(context, "/op_list");
                }, child: Text("O+ Donors List"),
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
                  Navigator.pushNamed(context, "/op_list_map_donors");
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.redAccent
                  primary: Colors.redAccent,
                  // onPrimary:  Colors.redAccent,
                ),
                 child: Text("O+ Donors Location")),
              )
            ],
          ),
        )
      ),
    );
  }

  // int _selectedIndex = 0;
  // // custom functions
  // void _navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // final List<Widget> _pages = [
  //   A_positiveList(),
  //   // A_positiveDonors_Map()
  //   // File1(),
  //   File2()
  // ];

  // // #2
  // int current_index = 0;
  // final screens = [
  //   A_positiveList(),
  //   A_positiveDonors_Map()
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: screens[current_index],//Container(),
  //     bottomNavigationBar: BottomNavigationBar(
  //       onTap: (index) => setState(() => current_index = index),
  //       currentIndex: current_index,
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.bloodtype_rounded),
  //           label: 'Donors List'
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.map_rounded),
  //           label: 'Donors Locations'
  //         )
  //       ]
  //     ),
  //   );
  // }

}