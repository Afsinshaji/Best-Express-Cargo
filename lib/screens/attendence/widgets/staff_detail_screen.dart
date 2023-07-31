import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/attendence/widgets/staff_details_list.dart';
import 'package:best_seller/screens/attendence/widgets/staff_image_dp.dart';
import 'package:flutter/material.dart';

class StaffDetailScreen extends StatelessWidget {
  const StaffDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    // var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: logoBlue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Staff Name",
          style: TextStyle(color: headingColor),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mHeight / 22,
          ),
          Center(
            child: Column(
              children: [
                const StaffImageDp(),
                SizedBox(
                  height: mHeight / 22,
                ),
                StaffDetailList(firstField: "Date", secondField: "26-07-2023"),
                SizedBox(
                  height: mHeight / 60,
                ),
                StaffDetailList(firstField: "Staff Id", secondField: "BE0171"),
                SizedBox(
                  height: mHeight / 60,
                ),
                StaffDetailList(
                    firstField: "Clock In", secondField: "11:03:am"),
                SizedBox(
                  height: mHeight / 60,
                ),
                StaffDetailList(
                    firstField: "Clock Out", secondField: "11:03:am"),
                SizedBox(
                  height: mHeight / 60,
                ),
                StaffDetailList(
                    firstField: "Attendance", secondField: "Present"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
