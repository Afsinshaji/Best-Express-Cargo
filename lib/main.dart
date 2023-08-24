import 'dart:developer';

import 'package:best_seller/constant/const.dart';
import 'package:best_seller/providers/attendance_provider.dart';
import 'package:best_seller/providers/auth_provider.dart';
import 'package:best_seller/providers/booking_moving_provider.dart';
import 'package:best_seller/providers/booking_provider.dart';
import 'package:best_seller/providers/dashboard_provider.dart';
import 'package:best_seller/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  log(prefs.getString('token').toString());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => AuthStateManagement(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashBoardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AttendanceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        ),
        ChangeNotifierProvider(create: (context) => BookingMovingProvider(),)
      ], child: const MyApp())));
  // runApp( MyApp(token: prefs.getString('token'),));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: logoBlue),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const BottomNavigationBarScreen(),
        home: const WidgetTree());
  }
}
