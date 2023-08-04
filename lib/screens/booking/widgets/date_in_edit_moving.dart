import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/const.dart';


class DateInEditMoving extends StatefulWidget {
  const DateInEditMoving({super.key});

  @override
  State<DateInEditMoving> createState() => _DateInShippEditMoving();
}

class _DateInShippEditMoving extends State<DateInEditMoving> {
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
              "Date",
              style: GoogleFonts.sora(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:logoRed),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 22,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: logoBlue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
               
                  Text(
                    '$day/$month/$year',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Icon(Icons.calendar_today_rounded)
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
