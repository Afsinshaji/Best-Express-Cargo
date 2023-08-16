import 'dart:developer';

import 'package:best_seller/constant/const.dart';
import 'package:best_seller/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, });
 
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
   late  SharedPreferences prefs;
   String? myToken;
   
Future<void> initPrefsAndToken() async {
    prefs = await SharedPreferences.getInstance();
    // myToken = prefs.getString('token') ?? '';
    setState(() {
      
   myToken = prefs.getString('token');
    });
    log("On Navigation Bar: $myToken");
  }
  @override
  void initState() {
    initPrefsAndToken();
    // print(myToken);
    // TODO: implement initState
    super.initState();
  }
  // Map<String,dynamic> decodedToken = JwtDecoder.decode(widget.token);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.sizeOf(context).width/10,),
            Text(
              'Dash',
              style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: mainConColor),
            ),
            Text(
              "bo",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "ard",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: mainConColor,
              ),
            ),
          ],
        ),
        actions: [
          Consumer<AuthStateManagement>(
            builder: (context, value, child) => 
            IconButton(onPressed: (){
              value.logout(context);
            }, icon: const Icon(Icons.logout,color: whiteShade,size:25,)),
          )
        ],
      ),
      // backgroundColor: mainConColor,
      //  body:
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              myToken??'Dash',
              style: const TextStyle(fontSize: 50, color: logoBlue),
            )),
          ],
        ),
      ),
    );
  }
}
