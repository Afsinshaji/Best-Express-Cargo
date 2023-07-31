import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/const.dart';

class DatePickerWidgetDateTo extends StatefulWidget {
  const DatePickerWidgetDateTo({super.key});

  @override
  State<DatePickerWidgetDateTo> createState() => _DatePickerWidgetDateToState();
}

class _DatePickerWidgetDateToState extends State<DatePickerWidgetDateTo> {
  DateTime selectedDate = DateTime.now();

  // Future to show the date picked and update the selected date

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900), // Set the range of allowed dates (optional)
      lastDate: DateTime(2101), // Set the range of allowed dates (optional)
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var day = selectedDate.day;
    var month = selectedDate.month;
    var year = selectedDate.year;
    return InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date To",
              style: GoogleFonts.sora(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:Colors.white),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 18,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: logoBlue),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$day/$month/$year',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          selectDate(context);
        });
  }
}
