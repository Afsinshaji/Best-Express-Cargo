import 'package:flutter/material.dart';

import '../../../constant/const.dart';

// ignore: must_be_immutable
class StaffDetailList extends StatelessWidget {
  StaffDetailList({
    super.key,
    required this.firstField,
    required this.secondField,
  });

  String firstField;
  String secondField;

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    return Container(
        height: mHeight / 15,
        width: mWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: mainConColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: mWidth / 40,
            ),
            SizedBox(
              width: mWidth / 3.5,
              child: Text(
                firstField,
                style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 97, 95, 95),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: mWidth / 15,
            ),
             SizedBox(
              width:mWidth/15,
              child: const Center(
                child: Text(
                  ":",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(width: mWidth/22,),
            Text(secondField,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 60, 91, 116))),
          ],
        ));
  }
}
