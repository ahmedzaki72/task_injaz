import 'dart:convert';
import 'package:flutter_injaz_task/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService{
  String _token;
  String _email;
  String _userId;


  String get token {
    return _token;
  }

  String get email {
    return _email;
  }

  String get userId {
    return _userId;
  }




  Future<void> signUp(String email, String password, String username,
      [bool company = false]) async {
    String url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDJNHQk7YMrzYQAQOkKyBsWUg2cdKG_YwI";
    final response = await http.post(
      url,
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    if (response.statusCode == 200) {
      final responseInfo = await jsonDecode(response.body);
      _token = responseInfo['idToken'];
      _email = responseInfo['email'];
    }
    String url1 = 'https://flutter-task-e7cbb-default-rtdb.firebaseio.com/users.json';
    final responseData = await http.post(
      url1,
      body: jsonEncode(
        User(
          username: username,
          email: email,
          company: company,
        ),
      ),
    );
    print(_token);
    print(_email);
  }

  Future<void> signIn(String email, String password) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDJNHQk7YMrzYQAQOkKyBsWUg2cdKG_YwI";
    final response = await http.post(
      url,
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    if(response.statusCode == 200) {
      final responseData = await jsonDecode(response.body);
      _token = responseData['idToken'];
      _email = responseData['email'];
      _userId = responseData['localId'];
    }
    print(_token);
    print(_email);
    print(_userId);
  }

}
