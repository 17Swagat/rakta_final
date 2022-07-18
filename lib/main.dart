import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rakta_blood_donation/donate/donor01_list.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/abp.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/an.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/ap.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/bn.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/bp.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/abn_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/abp_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/an_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/ap_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/bn_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/bp_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/on_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/main/op_main.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/abp_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/an_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/ap_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/bn_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/bp_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/on_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/maps/op_maps.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/on.dart';
import 'package:rakta_blood_donation/donate/donorsbloodGroups/op.dart';
import 'package:rakta_blood_donation/home/allrequest.dart';
import 'package:rakta_blood_donation/home/emergenceBloodNeed.dart';
import 'package:rakta_blood_donation/home/profile.dart';
import 'package:rakta_blood_donation/home/profile2.dart';
import 'package:rakta_blood_donation/loginAndSignup/loginScreen.dart';
import 'package:rakta_blood_donation/maps/donorsMap.dart';
import 'package:rakta_blood_donation/notification/acceptedNotification.dart';
import 'package:rakta_blood_donation/notification/notificationMain.dart';
import 'package:rakta_blood_donation/notification/notification_list.dart';
import 'package:rakta_blood_donation/notification/viewOnMap.dart';
import 'home/home.dart';
import 'loginAndSignup/login.dart';
import 'loginAndSignup/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAKTA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: '/',//'/emergencyNeedHelp',//'/profile2',//'/donor01_list',//'/ap_list_map_donors',//'/ap_list',//'/donor01_list',//'/donorsMap',//'/donor01_list',
      routes: {
        
        '/':(context) => LoginPage(),

        '/emergencyNeedHelp': (context) => EmergencyNeedBlood(),
        
        '/login': (context) => LoginPage(),
        '/loginScreen': (context) => LoginScreen(),

        '/register': (context) => RegisterPage(),
        '/home':(context) => HomePage(),
        '/profile': (context) => Exp_ProfilePage(),
        '/profile2': (context) => Profile2(),
        '/allRequestsPage': (context) => AllRequestsPage(),
        '/notificationMain': (context) => NotificationMain(),
        '/notificationList': (context) => NotificationList(),
        '/notificationAccepted': (context) => AcceptedNotifcations(),
        // '/viewOnMap':(context) => ViewOnMap({required this.name, required this.email, required this.userPosition}),

        '/donor01_list': (context) => Donor01_List(),

        // Donors Blood Group Lists (a+,a-,b+,b-,o+,o-,ab+,ab-)
        '/ap_list': (context) => A_PositiveList(),
        '/bp_list': (context) => B_PositiveList(),
        '/op_list': (context) => O_PositiveList(),
        '/abp_list': (context) => AB_PostiveList(),
        
        '/an_list': (context) => A_NegativeList(),
        '/bn_list': (context) => B_NegativeList(),
        '/on_list': (context) => O_NegativeList(),
        '/abn_list': (context) => AB_negativeList(),

        // Map 
        // M.1) Donors Map
        '/donorsMap': (context) => DonorsMap(),
        // M.1) Requesters Map
        // X.3) Maps By Blood Groups (Donors)
        '/ap_list_map_donors': (context) => A_positiveDonors_Map(),
        '/bp_list_map_donors': (context) => B_positiveDonors_Map(),
        '/op_list_map_donors': (context) => O_positiveDonors_Map(),
        '/abp_list_map_donors': (context) => AB_postiveDonors_Map(),

        '/an_list_map_donors': (context) => A_negativeDonors_Map(),
        '/bn_list_map_donors': (context) => B_negativeDonors_Map(),
        '/on_list_map_donors': (context) => O_negativeDonors_Map(),
        '/abn_list_map_donors': (context) => AB_negativeDonors_Map(),

        // main pages donors
        '/ap_main_donors': (context) => A_positiveMain(),
        '/bp_main_donors': (context) => B_positiveMain(),
        '/op_main_donors': (context) => O_positiveMain(),
        '/abp_main_donors': (context) => AB_positiveMain(),
        
        '/an_main_donors': (context) => A_negativeMain(),
        '/bn_main_donors': (context) => B_negativeMain(),
        '/on_main_donors': (context) => O_negativeMain(),
        '/abn_main_donors': (context) => AB_negativeMain(),

      },
    );
  }
}
