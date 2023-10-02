import 'package:flutter/material.dart';
import 'package:plant_doctor/screens/flash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:plant_doctor/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
       initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: FlashScrren(),
      ),
    );
  }
}

