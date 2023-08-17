import 'dart:developer';

import 'package:best_seller/navbar/animated_bottom.dart';
import 'package:best_seller/providers/auth_provider.dart';
import 'package:best_seller/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  late Future<String> tokenFuture;

  @override
  void initState() {
    checkAuthentication();
    super.initState();
    // tokenFuture = initPrefsAndToken();
  }
// Future<String> initPrefsAndToken() async {
//   final prefs = await SharedPreferences.getInstance();
//   final myToken = prefs.getString('token') ?? ''; // Default to an empty string if token is null
//   return myToken;
// }
Future<void> checkAuthentication() async {
    bool authenticated = await Provider.of<AuthStateManagement>(context,listen: false).checkAuthentication(); // Implement this method
log(authenticated.toString());
    if (authenticated) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AnimatedBottomNavBar(),
        ),
      );
    }else{
       Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

@override
Widget build(BuildContext context) {
  return const Center(child: CircularProgressIndicator(),);
  // return FutureBuilder<String>(
  //   future: tokenFuture,
  //   builder: (context, snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return CircularProgressIndicator();
  //     } else if (snapshot.hasError || snapshot.data == null) {
  //       print("Error or null token: ${snapshot.error}");
  //       return LoginScreen();
  //     } else {
  //       final token = snapshot.data!;

  //       try {
  //         if (JwtDecoder.isExpired(token)) {
  //           return LoginScreen();
  //         } else {
  //           return DashBoardScreen();
  //         }
  //       } catch (e) {
  //         print("Error decoding/validating token: $e");
  //         return LoginScreen();
  //       }
  //     }
  //   },
  // );
}

}
