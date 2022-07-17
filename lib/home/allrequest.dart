
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:loginuicolors/allrequest_pages/accountpage.dart';
// import 'package:loginuicolors/allrequest_pages/homepage.dart';
// import 'package:loginuicolors/allrequest_pages/messagespage.dart';
// import 'package:loginuicolors/allrequest_pages/settingspage.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/donor/donorsInfoList.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/requesters/requestersInfoList.dart';
// import 'package:loginuicolors/requestersInfoList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakta_blood_donation/donate/donorsList.dart';

class AllRequestsPage extends StatefulWidget {
  const AllRequestsPage({Key? key}) : super(key: key);

  @override
  State<AllRequestsPage> createState() => _AllRequestsPageState();
}

class _AllRequestsPageState extends State<AllRequestsPage> {
  // custom variables
  int _selectedIndex = 0;
  // custom functions
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    DonorsInfoListPage(),
    // RequestersInfoListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bloodtype_outlined), 
                  label: 'Donors List'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bloodtype_rounded), 
                  label: 'Requesters List'
              ),
            ]),
      ),
    );
  }
}


// /////////////////////////////////////////////////
// /////////////////////////////////////////////////
// /////////////////////////////////////////////////
//                   LEARNINGS
// /////////////////////////////////////////////////
// /////////////////////////////////////////////////
// /////////////////////////////////////////////////


/*
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loginuicolors/allrequest_pages/accountpage.dart';
import 'package:loginuicolors/allrequest_pages/homepage.dart';
import 'package:loginuicolors/allrequest_pages/messagespage.dart';
import 'package:loginuicolors/allrequest_pages/settingspage.dart';

class AllRequestsPage extends StatefulWidget {
  const AllRequestsPage({Key? key}) : super(key: key);

  @override
  State<AllRequestsPage> createState() => _AllRequestsPageState();
}

class _AllRequestsPageState extends State<AllRequestsPage> {
  // custom variables
  int _selectedIndex = 0;
  // custom functions
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Home__page(),
    Messages__page(),
    Settings__pages(),
    Account__page()
    // Center(
    //   child: Text('Home'),
    // ),
    // Center(
    //   child: Text('Messages'),
    // ),
    // Center(
    //   child: Text('Settings'),
    // ),
    // Center(
    //   child: Text('Account'),
    // ),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        // body: Center(
        //   child: Text('Hello'),
        // ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), 
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), 
                  label: 'Message'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), 
                  label: 'Settings'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), 
                  label: 'Account'
              ),
            ]),
        // appBar: AppBar(
        //   backgroundColor: Colors.redAccent,
        // ),
        /*bottomNavigationBar: GNav(
          backgroundColor: Color.fromARGB(255, 245, 63, 63),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Color.fromARGB(
              255, 129, 122, 122), //Color.fromARGB(255, 234, 76, 76),
          gap: 8,
          padding: EdgeInsets.all(16),
          onTabChange: (index) {
            print("$index");
          },
          tabs: const [
            GButton(
              icon: Icons.bloodtype_outlined,
              text: 'Donors List',
              // text: 'Donors',
            ),

            GButton(
              icon: Icons.bloodtype,
              text: 'Requesters List',
            ),
          ],*/
      ),
    );
  }
}

*/