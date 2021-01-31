import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/auth/controller/auth_provider.dart';
import 'package:flutter_injaz_task/auth/loginScreen.dart';
import 'package:flutter_injaz_task/home/HomeScreen.dart';
import 'package:flutter_injaz_task/widgets/custom_text.dart';
import 'package:flutter_injaz_task/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

// enum UserTypes {
//   customer,
//   company,
// }

List<String> userTypes = ['customer', 'company'];

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email, password, username;
  String types = 'customer';
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

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
                      title: 'REGISTER',
                      fontSize: 20,
                      color: Colors.green,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                        value: types,
                        onChanged: ( newValue) {
                          setState(() {
                            types = newValue;
                          });
                        },
                        items: userTypes.map(( classType) {
                          return DropdownMenuItem(
                              value: classType,
                              child: Text(classType));
                        }).toList()),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFrom(
                      text: 'username',
                      hintText: 'Username',
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return "Please enter username  or correct username ";
                        }
                      },
                      save: (value) {
                        username = value;
                      },
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
                      security: true,
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return "Please enter password or correct password ";
                        }
                      },
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
                         if(types == 'company') {
                          Provider.of<AuthProvider>(context, listen: false).signUp(email, password, username, true).then((value) {
                            Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                          });

                         }else {

                           Provider.of<AuthProvider>(context, listen: false).signUp(email, password, username).then((value) {
                             Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                           });

                         }
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
                                context, LoginScreen.routeName);
                          },
                          child: CustomText(
                            title: 'login',
                            fontSize: 15,
                            color: Colors.grey,
                            alignment: Alignment.center,
                          ),
                        ),
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
