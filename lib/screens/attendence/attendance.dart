import 'dart:developer';

import 'package:best_seller/providers/attendance_provider.dart';
import 'package:best_seller/common/date_piccker_date_to.dart';
import 'package:best_seller/common/date_picker_date_from.dart';
import 'package:best_seller/model/attendance_api_model.dart';
import 'package:best_seller/screens/attendence/widgets/attendence_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  // void initState() {
  //   super.initState();
  //   fetchAttendenceData();
  // }

  // late List<Datum> attendanceList = [];
  // late List<Datum> filteredAttendanceList = [];
  // TextEditingController searchController = TextEditingController();

  // void fetchAttendenceData() async {
  //   Data? data = await AttendenceApi().getAllStaff();
  //   if (data != null && data.data.isNotEmpty) {
  //     setState(() {
  //       attendanceList = data.data;
  //       filteredAttendanceList = attendanceList;
  //     });
  //   }
  // }

  // void filterAttendance(String searchTerm) {
  //   setState(() {
  //     filteredAttendanceList = attendanceList.where((attendance) {
  //       final name = attendance.fullName.toLowerCase();
  //       return name.contains(searchTerm.toLowerCase());
  //     }).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // AttendenceApi attendenceService = AttendenceApi();
    // Provider.of<AttendanceProvider>(context).fetchAttendanceData();
    // Provider.of<AttendanceProvider>(context, listen: false)
    //     .fetchStaffById(context);

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
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DatePickerWidgetDateFrom(),
                    DatePickerWidgetDateTo(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, bottom: 10, top: 15),
                  child: SizedBox(
                    height: 40,
                    child: CupertinoSearchTextField(
                      controller: Provider.of<AttendanceProvider>(context)
                          .searchController,
                      onChanged: Provider.of<AttendanceProvider>(context)
                          .filterAttendance,
                      suffixIcon: const Icon(
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
          Consumer<AttendanceProvider>(
            builder: (context, value, _) => FutureBuilder(
              future: value.httpCovertedCode(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  final attendanceList = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                  log(' IN UI ${attendanceList[index].fullName.toString()}');
                        return AttendenceContainer(
                          snapShot: attendanceList,
                          index: index,
                        );
                      },
                      itemCount: attendanceList.length,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
