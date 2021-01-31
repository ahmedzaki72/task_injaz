import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestProvider extends ChangeNotifier {
  final userId;
  final token;

  RequestProvider(
    this.userId,
    this.token,
  ) {
    ///initializing data.
    fetchingAllRequest();
  }

  Future<void> addingRequest(
    String name,
    String address,
    String zip,
    String companyName,
    DateTime dateTime,
    double latitudeData,
    double longitudeData,
    File images,
  ) async {

    dynamic myEncode(dynamic item) {
      if(item is DateTime) {
        return item.toIso8601String();
      }
      return item;
    }
    final str = jsonEncode(dateTime, toEncodable: myEncode);
    String url =
        "https://flutter-task-e7cbb-default-rtdb.firebaseio.com/requests/$userId.json?auth=$token";
    final response = await http.post(
      url,
      body: jsonEncode(
        {
          'name': name,
          'address': address,
          'zip': zip,
          'companyName': companyName,
          'dateTime': str,
          'latitude': latitudeData,
          'longitude': longitudeData,
          'companyLogo': images.path,
          'status': 'Established',
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
    }
  }

  Future<void> fetchingAllRequest() async {
    String url = "https://flutter-task-e7cbb-default-rtdb.firebaseio.com/requests.json?auth=$token";
    final response = await http.get(url);
    List<RequestProvider> loadingRequest = [];
    final responseData = jsonDecode(response.body) as Map<String , dynamic>;
    if(responseData == null) {
      print('all data is null');
      return;
    }
   responseData.forEach((requestId, requestData) {
     print(requestId);
     print(responseData.values.first['']);
   });

  }
}
