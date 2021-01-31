import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  static const String routeName = "personal_screen";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Personal Data',
          style: TextStyle(color: Colors.green, fontSize: 30),
        ),
      ),
    );
  }
}
