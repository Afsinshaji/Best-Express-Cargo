import 'package:best_seller/constant/const.dart';
import 'package:best_seller/model/attendance_api_model.dart';
import 'package:best_seller/screens/attendence/widgets/staff_details_list.dart';
import 'package:best_seller/screens/attendence/widgets/staff_image_dp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StaffDetailScreen extends StatelessWidget {
  StaffDetailScreen({super.key, required this.snapShot, required this.index});
  List<Datum> snapShot;
  final int index;
  @override
  Widget build(BuildContext context) {
    var day = snapShot[index].createdAt.day;
    var date =snapShot[index].createdAt.month;
    var year = snapShot[index].createdAt.year;
    var upDay = snapShot[index].updatedAt.day;
    var upDate =  snapShot[index].updatedAt.month;
    var upYear =  snapShot[index].updatedAt.year;
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
          snapShot[index].fullName,
          style: const TextStyle(color: headingColor),
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
                
                StaffDetailList(firstField:"Date", secondField: "$day/$date/$year"),
                SizedBox(
                  height: mHeight / 60,
                ),
                // StaffDetailList(firstField:"Staff Id" , secondField: snapShot[index].staffId),
                SizedBox(
                  height: mHeight / 60,
                ),
                StaffDetailList(
                    firstField: "Clock In", secondField:  "$upDay/$upDate/$upYear"),
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
