import 'package:flutter/material.dart';
import 'package:plant_doctor/screens/authenticate/AuthNavigation.dart';
import 'package:plant_doctor/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return AuthNavigation();
    } else {
      return Home();
    }
  }
}
