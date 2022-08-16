import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'dart:async';
import 'recipe_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => RecipeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOMEBREW",
                style: TextStyle(
                    //fontFamily: 'norwester',
                    fontSize: 48,
                    color: Color(0xFFFFFFFF))),
            //fontWeight: FontWeight.w400)),
            Text("Great Coffee at Home",
                style: TextStyle(
                    //fontFamily: 'Kollektif',
                    fontSize: 18,
                    //fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF)))
          ],
        ),
      ),
    );
  }
}
