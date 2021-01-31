import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/auth/controller/auth_provider.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  bool company;
  final userId;
  final token;

  // bool get company {
  //   return _company;
  // }
  UserProvider(this.userId, this.token){
    getUserData();
  }
  // ?auth=$token
  Future<void> getUserData()async{
   String  url = 'https://flutter-task-e7cbb-default-rtdb.firebaseio.com/users.json?auth=$token&orderBy="createAt"&equalTo="$userId"';
   final response = await http.get(url);
   if(response.statusCode == 200) {

     final responseData = await jsonDecode(response.body) as Map<String, dynamic> ;
     company = responseData.values.first['company'];
   }
   notifyListeners();
  }

}