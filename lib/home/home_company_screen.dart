import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/home/controller/request_provider.dart';
import 'package:flutter_injaz_task/home/widget/adding_request.dart';
import 'package:provider/provider.dart';

class HomeCompanyScreen extends StatefulWidget {
  @override
  _HomeCompanyScreenState createState() => _HomeCompanyScreenState();
}

class _HomeCompanyScreenState extends State<HomeCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<RequestProvider>(context).fetchingAllRequest();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 30),
              child: Center(
                child: Text(
                  'Welcome to  company account',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
