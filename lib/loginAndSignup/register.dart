import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rakta_blood_donation/home/home.dart';
import 'package:rakta_blood_donation/loginAndSignup/gender_selected.dart';

// Gloal registeration boolean value
bool registerationSucccess = false;

// Global variable
var storeName;
var storeBloodGroup;
var storeAge;
var storeGender;
var storePhoneNumber;
var storeEmail;
var storePassword;
var storeCityTown;
var storePincode;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text editing controller
  TextEditingController userNameTEC = TextEditingController();
  TextEditingController userPhoneNumberTEC = TextEditingController();
  TextEditingController userAgeTEC = TextEditingController();
  TextEditingController userBloodGroupTEC = TextEditingController();
  TextEditingController userCityTownTEC = TextEditingController();
  TextEditingController userPincodeTEC = TextEditingController();
  TextEditingController userEmailTEC = TextEditingController();
  TextEditingController userPasswordTEC = TextEditingController();
  // gender
  TextEditingController userGenderTEC = TextEditingController();
  int _value_gender = 1;
  GenderSelectionController genderSelectionController =
      Get.put(GenderSelectionController());

  //functions

  firebasemangingFunction() async {
    storeName = userNameTEC.text;
    storePassword = userPasswordTEC.text;
    storeEmail = userEmailTEC.text;
    storePhoneNumber = userPhoneNumberTEC.text;
    storeAge = userAgeTEC.text;
    storeCityTown = userCityTownTEC.text;
    storeBloodGroup = userBloodGroupTEC.text;
    storePincode = userPincodeTEC.text;
    storeGender = userGenderTEC.text;

    // authenticating
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: storeEmail,
          password: storePassword,
        )
        .then((value) => () async {
              print("successfully created new account!!");
              registerationSucccess = true;
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            })
        .onError((error, stackTrace) => () async {
              print("error ${error.toString()}");
            });

    // store data in the firestore
    await FirebaseFirestore.instance
        // .collection('register')
        // .collection('register')
        .collection('Register')
        .doc('$storeEmail')
        .set({
      'Name': storeName,
      'Email': storeEmail,
      'Password': storePassword,
      'Blood Group': storeBloodGroup,
      'Gender': storeGender,
      'Age': storeAge,
      'City Town': storeCityTown,
      'Pincode': storePincode,
      'Phone Number': storePhoneNumber,
    });

    // #1.1 Worked but here the fetching of stored data became an obstacle
    // await FirebaseFirestore.instance
    //     .collection('Notification Donate')
    //     // .doc('x')//'${snapshot.data!.docs[index]['Email']}')
    //     .doc(
    //         '${await FirebaseAuth.instance.currentUser!.email}')
    //     .set({
    //       "Blood Requesters From": FieldValue.arrayUnion([
    //         {
    //           'Email': '(Test) ${await FirebaseAuth.instance.currentUser!.email}',
    //         },
    //       ])
    //     });

    // #1.2
    await FirebaseFirestore.instance
        .collection('Notify Donate')
        .doc('${await FirebaseAuth.instance.currentUser!.email}')
        .collection('Requests')
        .doc('${await FirebaseAuth.instance.currentUser!.email}')
        .set({
      'To': 'None_Email',
      'From': 'None_Email',
      // 'Accepted': 'pending', //pending, accpeted , (@'rejected' is not required since we will delete the docs, if its rejected)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/my_login_graphics.jpg'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("RAKTA"),
          backgroundColor: Color.fromARGB(255, 235, 26, 68),
        ),
        backgroundColor: Color.fromARGB(0, 239, 217, 217),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 125, top: 90),
                child: Text(
                  // 'Create\nAccount',
                  'REGISTER',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userNameTEC,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.emailAddress,
                              controller: userEmailTEC,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userPasswordTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Mobile No",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.phone,
                              controller: userPhoneNumberTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText:
                                      "Blood Group (A+, B+, AB+, A-, O-, etc.)",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userBloodGroupTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Age",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.number,
                              controller: userAgeTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),

                            /*
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Gender (male/female/others)",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.text,
                              controller: userGenderTEC,
                            ),*/

                            // SizedBox(
                            //   height: 40,
                            // ),

                            // Here I'll implement code
                            // for male/female/others radio button
                            Text(
                              "Gender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              children: [
                                // Expanded(
                                //   child: Text(
                                //     "Gender",
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 1
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                Row(
                                  children: [
                                    // male
                                    Obx(
                                      () => Radio(
                                          value: "male",
                                          groupValue: genderSelectionController
                                              .selectedGender.value,
                                          activeColor: Colors.red,
                                          onChanged: (value) {
                                            genderSelectionController
                                                .onChangeGender(value);
                                            userGenderTEC.text = "male";
                                          }),
                                    ),
                                    Text("Male"),
                                    // female
                                    Obx(
                                      () => Radio(
                                          value: "female",
                                          groupValue: genderSelectionController
                                              .selectedGender.value,
                                          activeColor: Colors.red,
                                          onChanged: (value) {
                                            genderSelectionController
                                                .onChangeGender(value);
                                            userGenderTEC.text = "female";
                                          }),
                                    ),
                                    Text("Female"),
                                    // others
                                    Obx(
                                      () => Radio(
                                          value: "others",
                                          groupValue: genderSelectionController
                                              .selectedGender.value,
                                          activeColor: Colors.red,
                                          onChanged: (value) {
                                            genderSelectionController
                                                .onChangeGender(value);
                                            userGenderTEC.text = "others";
                                          }),
                                    ),
                                    Text("Others"),
                                  ],
                                )
                              ],
                            )

                            // Row(
                            //   // RadioButtons: Gender Male/Female/Others
                            //   children: [
                            //     Text("Male"),
                            //     // Male
                            //     Radio(
                            //       value: 1,
                            //       groupValue: _value_gender,
                            //       onChanged: (value) {
                            //         setState(() {
                            //           _value_gender = 1;
                            //         });
                            //       },
                            //     ),
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     // Female
                            //     Text("Female"),
                            //     Radio(
                            //       value: 2,
                            //       groupValue: _value_gender,
                            //       onChanged: (value) {
                            //         setState(() {
                            //           _value_gender = 2;
                            //         });
                            //       },
                            //     ),
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     // Others
                            //     Text("Others"),
                            //     Radio(
                            //       value: 3,
                            //       groupValue: _value_gender,
                            //       onChanged: (value) {
                            //         _value_gender = 3;
                            //       },
                            //     ),
                            //   ],
                            // ),

                            ,
                            SizedBox(
                              height: 40,
                            ),

                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Address",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userCityTownTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Pin No",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.number,
                              controller: userPincodeTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      if (userNameTEC.text.isEmpty ||
                                          userPhoneNumberTEC.text.isEmpty ||
                                          userAgeTEC.text.isEmpty ||
                                          userBloodGroupTEC.text.isEmpty ||
                                          userCityTownTEC.text.isEmpty ||
                                          userPincodeTEC.text.isEmpty ||
                                          userEmailTEC.text.isEmpty ||
                                          userGenderTEC.text.isEmpty ||
                                          userPasswordTEC.text.isEmpty) {
                                        final text =
                                            "Incomplete information. Please check again";
                                        final snackBar =
                                            SnackBar(content: Text(text));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);

                                        // moving to the home page
                                        Navigator.pushNamed(context,
                                            "/home"); // NOT Working though. Don't know why.
                                      } else {
                                        final text =
                                            "User successfully registered. Please sign in to continue.";
                                        final snackBar =
                                            SnackBar(content: Text(text));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        firebasemangingFunction();
                                        setState(() {});
                                      }
                                    },
                                    icon: Icon(
                                      Icons.done_all_rounded,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextButton(
                              child: Text(
                                'Sign In',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 25),
                              ),
                              style: ButtonStyle(),
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                                // Navigator.pushNamed(context, '/page_register');
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
