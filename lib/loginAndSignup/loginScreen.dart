import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rakta_blood_donation/home/home.dart';
import 'package:rakta_blood_donation/loginAndSignup/forgotpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Login function (Releated to Firebase)
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for the email");
      }
    }
    return user;
  }

  /*
    * Function/code that will create the 'Report' collection on Firebase
  */
  // reportCollection(@required String email) async {
  //   await FirebaseFirestore.instance.collection('Reported Users').doc(email).set({
  //     'Reported Times': 0,
  //     // If the number of reports exceeds 5 times 
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // creating the text field controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();



    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/my_login_graphics.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.deepPurple[100],
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width) / 3, top: 130),
                // padding: EdgeInsets.,
                child: Text(
                  // 'Blood Donation',
                  'RAKTA',
                  style: TextStyle(
                      // color: Color.fromARGB(255, 255, 255, 255),
                      color: Colors.deepPurple[100],
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: "User Email",
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.blueAccent,
                                )),
                          ),
                         
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: "User Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,

                                    //releated to firebase ()

                                    onPressed: () async {
                                      //show a loading circle
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Colors.red,
                                              // strokeWidth: 4.0,
                                            ));
                                          });

                                      User? user =
                                          await loginUsingEmailPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              context: context);
                                      print(user);
                                      if (user == null) {
                                        // pop the loading circle
                                        Navigator.of(context).pop();
                                        //account not stored in our firebase data

                                        //showing the snackbar(aka toast {to some extent})
                                        final text =
                                            "Invalid Account!! Please register";
                                        final snackBar =
                                            SnackBar(content: Text(text));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);

                                        // Navigator.pushReplacementNamed(
                                        //   context, '/register');
                                        Navigator.pushNamed(context, "/register");
                                        // context, "/page_register");

                                      } else if (user != null) {
                                        // pop the loading circle
                                        Navigator.of(context).pop();

                                        // Setting up the `report` collection
                                        // reportCollection(_emailController.text.trim());

                                        //code to move to the Home page
                                        //account stored in our firebase data
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()));
                                      }
                                      //
                                      // Navigator.pushNamed(context, 'forgotpass');
                                    }, //*********** */
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                  // Navigator.pushNamed(context, '/page_register');
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ), //*/
      ),
    );
  }
}