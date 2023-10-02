import 'package:flutter/material.dart';
import 'package:plant_doctor/screens/wrapper.dart';

class FlashScrren extends StatefulWidget {
  const FlashScrren({super.key});

  @override
  State<FlashScrren> createState() => _FlashScrrenState();
}

class _FlashScrrenState extends State<FlashScrren> {
  @override
  void initState() {
    super.initState();

    // Delay for 5 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Wrapper()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 3, 125, 78),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/logo/plant.png',
              height: 150.0,
              width: 150.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Plant Doctor',
            style: TextStyle(
              color: Color.fromARGB(255, 3, 125, 78),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
            child: LinearProgressIndicator(
              color: Color.fromARGB(255, 3, 125, 78),
              backgroundColor: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}