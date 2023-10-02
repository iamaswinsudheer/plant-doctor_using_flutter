import 'package:flutter/material.dart';
import 'package:plant_doctor/services/auth.dart';
import 'package:plant_doctor/shared/constants.dart';
import 'package:plant_doctor/screens/home/home.dart';
import 'package:plant_doctor/shared/loading.dart';

bool loading = false;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/logo/plant.png',
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign In to Plant Doctor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter your email' : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (val) =>
                                val!.length < 6 ? 'Enter your password' : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loading()),
                                );
                                dynamic result = await _auth
                                    .signInWithEmailPassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'could not signin with those credentials';
                                  });
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => false,
                                  );
                                }
                              }
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 3, 125, 78),
                              minimumSize: const Size.fromHeight(50),
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              error,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.0,
                              ),
                            ),
                          )
                        ],
                      ))),
            ),
          );
  }
}
