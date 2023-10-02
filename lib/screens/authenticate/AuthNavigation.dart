import 'package:flutter/material.dart';
import 'package:plant_doctor/screens/authenticate/register.dart';
import 'package:plant_doctor/screens/authenticate/signin.dart';

class AuthNavigation extends StatelessWidget{
  const AuthNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 125, 78),
          title: const Text(
            'Plant Doctor',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 2.5,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                )
              ),
              Tab(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                )
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SignIn(),
            Register()
          ],
        ),
      ),
    ) ;
  }
}