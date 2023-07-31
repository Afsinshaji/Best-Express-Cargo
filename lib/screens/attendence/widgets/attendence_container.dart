import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/functions/location.dart';
import 'package:best_seller/screens/attendence/widgets/create_attendance.dart';
import 'package:best_seller/screens/attendence/widgets/staff_detail_screen.dart';
import 'package:flutter/material.dart';

class AttendenceContainer extends StatelessWidget {
  const AttendenceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    var day = today.day;
    var month = today.month;
    var year = today.year;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const StaffDetailScreen(),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: logoBlue),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: const Icon(Icons.account_circle_rounded, size: 50),
          title: const Text(
            "Cynosure",
            style: TextStyle(fontSize: 22),
          ),
          subtitle: Text("$day/$month/$year"),
          trailing: IconButton(
              onPressed: () {
                var time = DateTime.now();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateAttendcance(time: time),
                ));
                CurrentLocation().getCurrentLocation();
                AnimatedSnackBar.rectangle("Timing",
                        "CheckIn Time: 8:00 AM To 10:30 AM |Checkout Time :8:30 PM To 11:55 PM",
                        type: AnimatedSnackBarType.warning,
                        duration: const Duration(seconds: 5))
                    .show(context);

                log(time.toString());
              },
              icon: const Icon(
                Icons.add_circle_outline_sharp,
                size: 40,
                color: logoRed,
              )),
        ),
      ),
    );
  }
}
