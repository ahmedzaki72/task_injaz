import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/auth/controller/auth_provider.dart';
import 'package:flutter_injaz_task/auth/loginScreen.dart';
import 'package:flutter_injaz_task/auth/register_screen.dart';
import 'package:flutter_injaz_task/home/HomeScreen.dart';
import 'package:flutter_injaz_task/home/controller/request_provider.dart';
import 'package:flutter_injaz_task/home/controller/user_provider.dart';
import 'package:flutter_injaz_task/home/home_customer_screen.dart';
import 'package:flutter_injaz_task/home/widget/adding_request.dart';
import 'package:flutter_injaz_task/home/widget/first_screen.dart';
import 'package:flutter_injaz_task/home/widget/person_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(update: (_, auth , prevState) => UserProvider(auth.userId, auth.token)),
        ChangeNotifierProxyProvider<AuthProvider, RequestProvider>(update: (_, auth, prevState) => RequestProvider(auth.userId, auth.token)),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'InJaz task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginScreen(),
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            PersonalScreen.routeName :(context) => PersonalScreen(),
            AddingRequest.routeName : (context) => AddingRequest(),
            FirstScreen.routeName : (context) => FirstScreen(),
            HomeCustomerScreen.routeName : (context) => HomeCustomerScreen()
          },
        );
      },
    );
  }
}
