import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_doctor/screens/authenticate/AuthNavigation.dart';
import 'package:plant_doctor/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_doctor/screens/home/image_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  File? image;

  Future selectImages() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      showImageDialog();
    }
  }

  Future captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      showImageDialog();
    }
  }

  void showImageDialog() {
    showDialog(
        context: context,
        builder: (_) => ImageDialog(
              imageFile: image,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plant Doctor',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 25.0,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 3, 125, 78),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    TextButton(
                        onPressed: () async {
                          await _auth.signOut();
                          Navigator.pop(context);
                          setState(() {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthNavigation()),
                              (route) => false,
                            );
                          });
                        },
                        child: Text('Yes'))
                  ],
                ),
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        child: Column(children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo/plant.png',
                    height: 130.0,
                    width: 130.0,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to Plant Doctor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Plant Doctor is an innovative mobile application designed to assist plant enthusiasts and farmers in diagnosing plant diseases. With the power of artificial intelligence, our app helps identify and provide insights on various plant health issues, enabling users to take timely and informed actions for effective plant care.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
                          ],
                        ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                    child: ElevatedButton.icon(
                        onPressed: captureImage,
                        icon: Icon(Icons.camera_alt),
                        label: Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 3, 125, 78),
                            minimumSize: Size(0, 50))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: ElevatedButton.icon(
                        onPressed: selectImages,
                        icon: Icon(Icons.file_upload),
                        label: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 3, 125, 78),
                            minimumSize: Size(0, 50))),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
