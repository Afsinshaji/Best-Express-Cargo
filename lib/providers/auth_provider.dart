// import 'dart:developer';

// import 'package:best_seller/model/user_model.dart';
// import 'package:best_seller/navbar/animated_bottom.dart';
// import 'package:best_seller/services/dio.dart';
// import 'package:dio/dio.dart' as Dio;
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthStateManagement extends ChangeNotifier {
//   bool _isLoggedIn = false;

//   User? _user;
//   // String? _token;
//   final storage = const FlutterSecureStorage();

//   bool get authenticated => _isLoggedIn;
//   User? get user => _user;

//   Future<void> login(
//       String email, String password, BuildContext context) async {
//     // log(creds.toString());
//     try {
//       log(email);
//       log(password);
//       Dio.Response response = await dio().post(
//         '/login',
//         data: {
//           'email': email,
//           'password': password,
//         },
//       );
//       log("User info :${response.data['user']['email'].toString()}");

//       String token = response.data['token'].toString();

//       saveToken(token);

//       _isLoggedIn = true;
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => AnimatedBottomNavBar(),
//         ),
//       );
//       notifyListeners();
//     } catch (e) {
//       print('Login Error: $e');
//     }
//   }

//   Future<void> saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', token);

//     log('Token saved successfully: $token');
//   }

//   void logout() {
//     _isLoggedIn = false;
//     notifyListeners();
//     if (_isLoggedIn == false) {
//       log("false");
//     }
//   }
// }
import 'dart:developer';

import 'package:best_seller/model/user_model.dart';
import 'package:best_seller/navbar/animated_bottom.dart';
import 'package:best_seller/screens/widget_tree.dart';
import 'package:best_seller/services/dio.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStateManagement extends ChangeNotifier {
  bool _isLoggedIn = false;
  User? _user;
  var tokenGet;
  bool get authenticated => _isLoggedIn;
  User? get user => _user;

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      var response = await _performLogin(email, password);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data['token'].toString();
        saveToken(token);
        _isLoggedIn = true;

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => AnimatedBottomNavBar(),
          ),
        );
        notifyListeners();
      } else {
        // Handle non-200 status code here
        log('Login Failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors here
      log('Login Error: $e');
    }
  }

  Future _performLogin(String email, String password) async {
    try {
      return await dio().post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    log('Token saved successfully: $token');
  }

  Future<bool> checkAuthentication() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token != null;
  }

  Future getToken() async {
    SharedPreferences prefToken = await SharedPreferences.getInstance();
    tokenGet = prefToken.getString('token');
    log('gettoken $tokenGet');
    notifyListeners();
    return  tokenGet;
  }

  Future logout(BuildContext context) async {
   var token= getToken();
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://bestexpress.vahid.tech/api",
        // queryParameters: {
        //   'Authorization': 'Bearer ${getToken()}',
        // },
        headers: {
          'accept': '*/*',
          'Authorization': 'Bearer ${getToken()}',
        },
      ),
    );
    try {
      log(token.toString());
      Response response = await dio.post(
        '/logout',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Logout Successfull");
        deleteValueFromSharedPreferences('token');
        // checkAuthentication();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WidgetTree(),));
        notifyListeners();
      } else {
        log("Login FAiled");
      }
    } catch (e) {
      log("In Logout : $e");
    }
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> deleteValueFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    notifyListeners();
    // Optionally, you can also use prefs.clear() to remove all values
  }
}
