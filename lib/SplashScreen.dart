import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set up the duration of the splash screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage())

      );
    }
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(

            child: Image.network("https://www.shutterstock.com/shutterstock/videos/1100548605/thumb/12.jpg?ip=x480",
              fit: BoxFit.cover,


            ),
          ),

        ],
      ),
    );
  }
}

