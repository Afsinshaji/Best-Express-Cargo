import 'dart:developer';

import 'package:best_seller/model/user_model.dart';
import 'package:best_seller/navbar/animated_bottom.dart';
import 'package:best_seller/services/dio.dart';
import 'package:best_seller/widget_tree.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
            builder: (context) => const AnimatedBottomNavBar(),
          ),
        );
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: "Sign In Successfully",
          ),
        );
        notifyListeners();
      } else {
        // Handle non-200 status code here
        log('Login Failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors here
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter Correct UserName and Password",
        ),
      );
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
    return tokenGet;
  }

  Future<void> performLogout(BuildContext context) async {
    Dio dio = Dio(); // Create a Dio instance

    SharedPreferences tokenPref = await SharedPreferences.getInstance();
    String? token = tokenPref.getString('token');

    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';

      try {
        Response response = await dio.post(
          'https://bestexpress.vahid.tech/api/logout', // Replace with your API URL
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Handle the successful response
          await deleteValueFromSharedPreferences();
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => const WidgetTree(),
          ));
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.info(
              message: "SignOut Successfully",
            ),
          );
          log('Response Data: ${response.data}');
        } else {
          // Handle other status codes
          log('Request Failed with Status Code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle the error
        log('Error: $error');
      }
    } else {
      log('Bearer token not found.');
    }
  }

  Future<void> deleteValueFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }
}
