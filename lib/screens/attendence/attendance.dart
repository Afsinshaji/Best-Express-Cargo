import 'dart:developer';

import 'package:best_seller/api/api_service.dart';
import 'package:best_seller/common/date_piccker_date_to.dart';
import 'package:best_seller/common/date_picker_date_from.dart';
import 'package:best_seller/model/attendance_api_model.dart';
import 'package:best_seller/screens/attendence/widgets/attendence_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/const.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late List<Datum> filteredAttendanceList =[];

   
  @override
  Widget build(BuildContext context) {
    
    // AttendenceApi attendenceService = AttendenceApi();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Att",
              style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: mainConColor),
            ),
            Text(
              "enda",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "nce",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: mainConColor,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 6),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DatePickerWidgetDateFrom(),
                    DatePickerWidgetDateTo(),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 15),
                  child: SizedBox(
                    height: 40,
                    child: CupertinoSearchTextField(
                      suffixIcon: Icon(
                        CupertinoIcons.xmark_circle_fill,
                        size: 22,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: AttendenceApi().getAllStaff(),
            builder: (context, snapshot) {
              // print(snapshot);
              log(snapshot.data.toString());
              if (snapshot.hasData) {
                Data? attendanceList = snapshot.data;
                if (attendanceList != null && attendanceList.data.isNotEmpty) {
                  return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        AttendenceContainer(snapShot: attendanceList.data, index: index),
                    itemCount: attendanceList.data.length,
                  ),
                );
                }else{
                   return const Center(child: Text('No data available'));
                }
                
              } else {
                return const Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ],
                );
              }
            }
          ),
        ],
      ),
    );
  }
}
