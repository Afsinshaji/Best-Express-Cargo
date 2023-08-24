import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/attendence/widgets/create_attendance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffNameInCreateAttendance extends StatelessWidget {
  const StaffNameInCreateAttendance({
    super.key,
    required this.widget,
    required this.mWidth,
  });

  final CreateAttendcance widget;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Staff Name",
              style: GoogleFonts.sora(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 9,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  color: whiteShade,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: greyShade)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.snapShot,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: mWidth / 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
    );
  }
}