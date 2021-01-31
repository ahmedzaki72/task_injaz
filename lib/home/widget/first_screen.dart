import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const String routeName = "first_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Welcome to Customer',
            style: TextStyle(color: Colors.green, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
