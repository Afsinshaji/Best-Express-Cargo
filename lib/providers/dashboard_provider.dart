import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardProvider extends ChangeNotifier  {

   late SharedPreferences prefs;
  String? myTokenfront;
    String? get myToken => myTokenfront;


  Future<void>  initPrefsAndToken() async {
    prefs = await SharedPreferences.getInstance();
    // myToken = prefs.getString('token') ?? '';
   
      myTokenfront = prefs.getString('token');

    log("On Navigation Bar: $myToken");
    notifyListeners();
  }
  
}