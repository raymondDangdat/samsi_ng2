import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
  TextEditingController();
  String gender;
  String groupValue = "male";
  bool loading = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
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
              "samsi.ng",
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
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
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Name field can not be empty";
                                  } else {
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
                          child: new Container(
                            color: Colors.white.withOpacity(0.4),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Male",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Radio(
                                          value: "male",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChanged(e)),
                                    )),
                                Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Female",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Radio(
                                          value: "female",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChanged(e)),
                                    )),
                              ],
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
                                  obscureText: hidePassword,
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
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        if (hidePassword)
                                          hidePassword = false;
                                        else
                                          hidePassword = true;
                                      });
                                    }),
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
                                  controller: _confirmPasswordTextController,
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Confirm Password field can not be empty";
                                    } else if (value.length < 6) {
                                      return "COnfirm password has to be at least 6 characters long";
                                    } else
                                    if (_passwordTextController.text != value) {
                                      return "Passwords do not match.";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        if (hidePassword)
                                          hidePassword = false;
                                        else
                                          hidePassword = true;
                                      });
                                    }),
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
                                onPressed: () {
                                  validateForm();
                                },
                                minWidth: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Text(
                                  "Sign Up",
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
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ))),
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
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  void validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text).then((user) => {

        });
      }
    }
  }
}
