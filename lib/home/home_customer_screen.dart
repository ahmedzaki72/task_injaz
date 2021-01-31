import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/home/widget/adding_request.dart';
import 'package:flutter_injaz_task/home/widget/first_screen.dart';
import 'package:flutter_injaz_task/home/widget/person_screen.dart';



class HomeCustomerScreen extends StatefulWidget {
  static const String routeName = 'home_customer_screen';
  @override
  _HomeCustomerScreenState createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  int  _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget>  screen = [
     FirstScreen(),
    AddingRequest(),
    PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar:  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.teal
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Adding',
              backgroundColor: Colors.lightBlue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.cyan
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: onTabTapped,
          elevation: 5
      ),
    );
  }
}
