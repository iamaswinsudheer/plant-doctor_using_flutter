import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
          color: Colors.white,
          child: Center(
            child: SpinKitFadingCircle(
              color: Color.fromARGB(255, 3, 125, 78),
              size: 70.0,
            ),
          )),
    );
  }
}