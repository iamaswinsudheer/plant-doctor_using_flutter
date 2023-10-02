import 'package:flutter/material.dart';
import 'package:plant_doctor/services/auth.dart';
import 'package:plant_doctor/shared/constants.dart';
import 'package:plant_doctor/screens/home/home.dart';
import 'package:plant_doctor/shared/loading.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = '';
  String password = '';
  String error = '';
  String password1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Register to Plant Doctor',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Enter your Email',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
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
                    'Enter your password',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText:
                            'Password'),
                    validator: (val) => val!.length < 6
                        ? 'Your password must be atleast 6 characters long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password1 = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Confirm password',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Confirm password'),
                    validator: (val) => val!.length == 0
                        ? 'please confirm your password'
                        : null,
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (password == password1) {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loading()));
                            dynamic result = await _auth
                                .registerWithEmailPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'There was an error while registering';
                              });
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                  (route) => false,
                                );
                              });
                            }
                          } else {
                            setState(() {
                              error = 'Passwords dosen\'t match';
                            });
                          }
                        }
                      },
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 3, 125, 78),
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
              ),
            )),
      ),
    );
  }
}
