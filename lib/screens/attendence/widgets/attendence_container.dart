import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:best_seller/api/api_service.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/functions/location.dart';
import 'package:best_seller/model/attendance_api_model.dart';
import 'package:best_seller/screens/attendence/widgets/create_attendance.dart';
import 'package:best_seller/screens/attendence/widgets/staff_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

// ignore: must_be_immutable
class AttendenceContainer extends StatelessWidget {
  AttendenceContainer({
    super.key,
    required this.snapShot,
    required this.index,
  });

  final snapShot;
  final int index;

  @override
  Widget build(BuildContext context) {
    // DateTime today = DateTime.now();
    var day = snapShot[index].createdAt.day;
    var month = snapShot[index].createdAt.month;
    var year = snapShot[index].createdAt.year;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              StaffDetailScreen(snapShot: snapShot, index: index),
        ));
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height / 14,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: logoBlue),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).width),
            child: Icon(Icons.account_circle_rounded,
                size: MediaQuery.sizeOf(context).width / 10),
          ),
          title: Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.sizeOf(context).width / 22),
            child: TextScroll(
              snapShot[index].fullName,
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
          ),
          // subtitle: Text("$day/$month/$year"),
          subtitle: Padding(
            padding:  EdgeInsets.only(bottom:  MediaQuery.sizeOf(context).width / 22),
            child: Text("$day-$month-$year"),
          ),
          trailing: IconButton(
              onPressed: () {
                var time = DateTime.now();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateAttendcance(
                    time: time,
                  ),
                ));
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
        ),
      ),
    );
  }
}
