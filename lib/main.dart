import 'dart:developer';

import 'package:best_seller/constant/const.dart';
import 'package:best_seller/providers/auth_provider.dart';
import 'package:best_seller/screens/dashboard/dashboard.dart';
// import 'package:best_seller/navbar/bottomnavbar.dart';
import 'package:best_seller/screens/sign_in/sign_in_screen.dart';
import 'package:best_seller/screens/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
      ], child:  MyApp())));
  // runApp( MyApp(token: prefs.getString('token'),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });
 
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
        home: WidgetTree());
  }
}
