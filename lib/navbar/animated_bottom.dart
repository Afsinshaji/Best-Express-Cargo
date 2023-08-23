import 'dart:developer';

import 'package:best_seller/constant/const.dart';
import 'package:best_seller/providers/auth_provider.dart';
import 'package:best_seller/screens/attendence/attendance.dart';
import 'package:best_seller/screens/booking/booking.dart';
import 'package:best_seller/screens/dashboard/dashboard.dart';
import 'package:best_seller/screens/shipping/shipping.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  const AnimatedBottomNavBar({super.key});

  @override
  State<AnimatedBottomNavBar> createState() => BAnimatedottomBState();
}

class BAnimatedottomBState extends State<AnimatedBottomNavBar> {
    late  SharedPreferences prefs;
   String? myToken;
  @override
  void initState() {
    // readToken(context);
   initPrefsAndToken();
    log("On Navigation Bar 1: $myToken");
    super.initState();
  }

  
   Future<void> initPrefsAndToken() async {
    prefs = await SharedPreferences.getInstance();
    // myToken = prefs.getString('token') ?? '';
   myToken = prefs.getString('token');
    log("On Navigation Bar 2: $myToken");
  }
  // void readToken(String? token) async {
  //   if (token != null) {
  //     Provider.of<AuthStateManagement>(context, listen: false).saveToken(token);
  //     log("token in nav bar : $token");
  //   } else {
  //     log("Token not found");
  //   }
  // }

  List<Widget> pages = [
     const DashBoardScreen(),
    const AttendanceScreen(),
    const BookingScreen(),
    const ShippingScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: logoBlue,
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.linear,
        items: const [
          Icon(
            Icons.dashboard,
            size: 30,
            color: whiteShade,
          ),
          Icon(
            Icons.switch_account_rounded,
            size: 30,
            color: whiteShade,
          ),
          Icon(
            Icons.book_online,
            size: 30,
            color: whiteShade,
          ),
          Icon(
            Icons.local_shipping,
            size: 30,
            color: whiteShade,
          )
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: pages[selectedIndex],
    );
  }
}
