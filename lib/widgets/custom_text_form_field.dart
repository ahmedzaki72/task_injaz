import 'package:flutter/material.dart';


class CustomTextFrom extends StatelessWidget {
  final String text;
  final String hintText;
  final Function(String) validator;
  final Function(String) save;
  final bool security ;
  final Color color;
  const CustomTextFrom({
    Key key,
    this.text,
    this.hintText,
    this.validator,
    this.save,
    this.security = false,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
          validator: validator,
          onSaved: save,
          obscureText: security,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: color,
            ),
          ),
    );
  }
}
