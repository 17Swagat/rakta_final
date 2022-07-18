import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

// var name = "Loading...";
// var bloodgroup = "Loading...";
// var age;// = "0";
// var address = "Loading...";
// var gender = "Loading...";
// var email = "Loading...";

String name = "Loading...";
String bloodgroup = "Loading...";
num age = 0;
String email = "Loading...";
String gender = "Loading...";
String address = "Loading...";

class _Profile2State extends State<Profile2> {

  // getting data from the firebase


  getUserData() async {
    // FirebaseAuth
    String? currentUserEmail = await FirebaseAuth.instance.currentUser!.email;

    // Firestore
    // await
    FirebaseFirestore.instance
        // .collection('page_userInfo')
        .collection('Register')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              if (document['Email'] ==
                  (FirebaseAuth.instance.currentUser!.email)) {
                name = document['Name'];
                bloodgroup = document['Blood Group'];
                age = num.parse(document['Age']); //document['Age'];
                email = document['Email'];
                gender = document['Gender'];
                address = document['City Town'];
              }
            }));
  }

  @override
  void initState() {
    // getUserById();
    getUserData();
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    setState(() {});
    getUserData();
    setState(() {});

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Color(0xff555555),
        backgroundColor: Colors.redAccent,
      ),
      body:
          // SingleChildScrollView(
          //   child:
          Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                      hintText: 'Name: $name',
                    ),
                    textfield(
                      hintText: 'Blood Group: $bloodgroup',
                    ),
                    textfield(
                      hintText: 'Gender: $gender',
                    ),
                    textfield(
                      hintText: 'Age: $age',
                    ),
                    textfield(
                      hintText: 'Email: $email',
                    ),
                    textfield(
                      hintText: 'Address: $address',
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/pImg.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      // ),
    );
  }
}

Widget textfield({@required hintText}) {
  return Material(
    elevation: 4,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 2,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white30,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none)),
    ),
  );
}
// }

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.redAccent; //Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
