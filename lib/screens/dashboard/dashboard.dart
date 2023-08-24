import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:best_seller/common/rflutter.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/functions/location.dart';
import 'package:best_seller/providers/dashboard_provider.dart';
import 'package:best_seller/screens/attendence/widgets/create_attendance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashBoardProvider>(context, listen: false)
          .initPrefsAndToken();
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 10,
            ),
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
          IconButton(
              onPressed: () {
                signOutDilogueBox(context);
              },
              icon: const Icon(
                Icons.logout,
                color: whiteShade,
                size: 25,
              )),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Consumer<DashBoardProvider>(
      //         builder: (context, value, child) => Center(
      //             child: Text(
      //           value.myToken ?? 'Dash',
      //           style: const TextStyle(fontSize: 30, color: logoBlue),
      //         )),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 14,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: logoBlue),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.account_circle_rounded,
                    size: MediaQuery.sizeOf(context).width / 10),
                Column(
                  children: [
                    TextScroll(
                      "snapShot[index].fullName",
                      velocity: const Velocity(pixelsPerSecond: Offset(80, 0)),
                      delayBefore: const Duration(milliseconds: 500),
                      numberOfReps: 10,
                      pauseBetween: const Duration(milliseconds: 500),
                      textAlign: TextAlign.right,
                      selectable: true,
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width / 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Text("day-month-year"),
                  ],
                ),
                IconButton(
                onPressed: () {
                  var time = DateTime.now();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => CreateAttendcance(
                  //     time: time,
                  //     snapShot: time,
                  //   ),
                  // ));
                  CurrentLocation().getCurrentLocation();
                  final snackBar = SnackBar(
                    padding: const EdgeInsets.all(30),
                    duration: const Duration(seconds: 3),
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      inMaterialBanner: true,
                      title: "Timing",
                      message:
                          "CheckIn Time: 8:00 AM To 10:30 AM |Checkout Time :8:30 PM To 11:55 PM",
                      contentType: ContentType.help,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
                  log(time.toString());
                },
                icon: Icon(
                  Icons.add_circle_outline_sharp,
                  size: MediaQuery.sizeOf(context).width / 12,
                  color: logoRed,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
