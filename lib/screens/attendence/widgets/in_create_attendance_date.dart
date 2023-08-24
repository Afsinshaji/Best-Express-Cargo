import 'package:best_seller/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InCreateAttendanceDate extends StatelessWidget {
  const InCreateAttendanceDate({
    super.key,
    required this.date,
    required this.month,
    required this.year,
    required this.mWidth,
  });

  final int date;
  final int month;
  final int year;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attendance Date",
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
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "$date/$month/$year",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: mWidth / 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
    );
  }
}