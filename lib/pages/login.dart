import 'package:flutter/material.dart';
import 'package:samsi/pages/home.dart';
import 'package:samsi/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedIn = false;
  @override
  void initState() {
    super.initState();

    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

//    preferences = await SharedPreferences.getInstance();
//    isLogedIn = await googleSignIn.isSignedIn();

    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Mahd oo");
    }

    setState(() {
      loading = false;
    });
  }

//  Future<String> handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//
//    setState(() {
//      loading = true;
//    });
////
////    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
////    final GoogleSignInAuthentication googleAuth =
////        await googleUser.authentication;
////    final AuthCredential credential = GoogleAuthProvider.getCredential(
////      accessToken: googleAuth.accessToken,
////      idToken: googleAuth.idToken,
////    );
////
////    final FirebaseUser firebaseUser =
////        (await firebaseAuth.signInWithCredential(credential)).user;
////
////    if (firebaseUser != null) {
////      final QuerySnapshot result = await Firestore.instance
////          .collection("users")
////          .where("id", isEqualTo: firebaseUser.uid)
////          .getDocuments();
////      final List<DocumentSnapshot> documents = result.documents;
////
////      if (documents.length == 0) {
////        Fluttertoast.showToast(msg: firebaseUser.displayName);
////        //create the user
////        Firestore.instance
////            .collection("users")
////            .document(firebaseUser.uid)
////            .setData({
////          "id": firebaseUser.uid,
////          "username": firebaseUser.displayName,
////          "profilePicture": firebaseUser.photoUrl
////        });
////
////        await preferences.setString("id", firebaseUser.uid);
////        await preferences.setString("username", firebaseUser.displayName);
////        await preferences.setString("photoUrl", firebaseUser.photoUrl);
////      } else {
//////        the user exist, set preferences
////        await preferences.setString("id", documents[0]['id']);
////        await preferences.setString("username", documents[0]['username']);
////        await preferences.setString("photoUrl", documents[0]['photoUrl']);
////      }
////      Fluttertoast.showToast(msg: "Login Successful");
////      setState(() {
////        loading = false;
////      });
////
////      Navigator.pushReplacement(
////          context, MaterialPageRoute(builder: (context) => HomePage()));
////    } else {
////      Fluttertoast.showToast(msg: "Login failed");
////      setState(() {
////        loading = false;
////      });
////    }
//  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/bg.jpeg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: new Text(
              "Logo",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
//            child: Image.asset("images/dangdat.jpg",
//            width: 150.0,
//                height: 150.0,),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Password field can not be empty";
                                    } else if (value.length < 6) {
                                      return "The password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: Icon(Icons.remove_red_eye),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Forgot password",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            child: Text("Sign Up", textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),)
                          )
                        ),
//
//                        Divider(color: Colors.white,),
//                        Text("Other login options", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Material(
//                              borderRadius: BorderRadius.circular(20.0),
//                              color: Colors.red,
//                              elevation: 0.0,
//                              child: MaterialButton(onPressed: (){
//                                handleSignIn();
//                              },
//                                minWidth: MediaQuery.of(context).size.width,
//                                child: Text("Google", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
//                              )
//                          ),
//                        ),
                      ],
                    ))),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),
//      bottomNavigationBar: Container(
//        child: Padding(
//          padding: const EdgeInsets.only(
//              left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
//          child: FlatButton(
//              color: Colors.red,
//              onPressed: () {
//                handleSignIn();
//              },
//              child: Text(
//                "Sign in / Sign up with google",
//                style: TextStyle(color: Colors.white),
//              )),
//        ),
//      ),
    );
  }
}
