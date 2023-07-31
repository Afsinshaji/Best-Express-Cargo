import 'package:best_seller/common/date_piccker_date_to.dart';
import 'package:best_seller/common/date_picker_date_from.dart';
import 'package:best_seller/screens/attendence/widgets/attendence_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Attendance",
          style: GoogleFonts.kanit(
            textStyle: Theme.of(context).textTheme.bodyLarge,
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 7),
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
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const AttendenceContainer(),
              itemCount: 25,
            ),
          )
        ],
      ),
    );
  }
}
