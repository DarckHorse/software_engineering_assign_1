import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 312, left: 20, right: 20),
              child: Text("enjoy your amazing\n handmade coffee",
                  style: TextStyle(fontSize: 25, color: Color(0xff4C748B))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 242),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  key: Key('done-button'),
                  child: Text('done',
                      style: TextStyle(fontSize: 18), key: Key('done-text')),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.01),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF4C748B)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
