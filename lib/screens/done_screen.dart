import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text("Enjoy your amazing\n handmade coffee", style: TextStyle(fontSize:25,  color: Color(0xff4C748B))),
            )
          )
    );
  }
}
