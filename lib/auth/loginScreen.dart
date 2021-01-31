import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/auth/controller/auth_provider.dart';
import 'package:flutter_injaz_task/auth/register_screen.dart';
import 'package:flutter_injaz_task/home/HomeScreen.dart';
import 'package:flutter_injaz_task/widgets/custom_text.dart';
import 'package:flutter_injaz_task/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,
            ),
            child: Form(
              key: _keyForm,
              child: Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: 'LOGIN',
                      fontSize: 20,
                      color: Colors.green,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFrom(
                      text: 'email',
                      hintText: 'Email',
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return "Please enter Email  or correct Email ";
                        }
                      },
                      save: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFrom(
                      text: 'password',
                      hintText: 'Password',
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return "Please enter password or correct password ";
                        }
                      },
                      security: true,
                      save: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FlatButton(
                      onPressed: () {
                        if (_keyForm.currentState.validate()) {
                          _keyForm.currentState.save();
                          Provider.of<AuthProvider>(context, listen: false).signIn(email, password).then((value) {
                            Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                          });
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: 'Create New Account ?',
                          fontSize: 17,
                          color: Colors.green,
                          alignment: Alignment.center,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RegisterScreen.routeName);
                            },
                            child: CustomText(
                              title: 'here',
                              fontSize: 15,
                              color: Colors.grey,
                              alignment: Alignment.center,
                            ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
