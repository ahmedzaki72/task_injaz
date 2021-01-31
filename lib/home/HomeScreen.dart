import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/home/controller/user_provider.dart';
import 'package:flutter_injaz_task/home/home_company_screen.dart';
import 'package:flutter_injaz_task/home/home_customer_screen.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  static const String routeName = 'howe_screen';

  @override
  Widget build(BuildContext context) {
    return Selector<UserProvider, bool>(
        selector: (ctx , val) => val.company,
        builder: (ctx, value, child) {
          print("working value $value");
          if(value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(value == true) {
            return HomeCompanyScreen();
          }
          return HomeCustomerScreen();
        },
    );
  }
}
