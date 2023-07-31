import 'package:best_seller/common/textfield_widget.dart';
import 'package:best_seller/functions/fingerprint.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';

// ignore: must_be_immutable
class CreateAttendcance extends StatefulWidget {
  CreateAttendcance({super.key, required this.time,});

  DateTime time;


  @override
  State<CreateAttendcance> createState() => _CreateAttendcanceState();
}

class _CreateAttendcanceState extends State<CreateAttendcance> {
  bool checkOut = false;
  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    // DateTime hour = time.
    var hour = widget.time.hour;
    var minute = widget.time.minute;
    var month = widget.time.month;
    var year = widget.time.year;
    var date = widget.time.day;

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
        title: const Text(
          "Create Attendance",
          style: TextStyle(color: headingColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          // margin: const EdgeInsets.all(20),
          height: mHeight,
          width: mWidth,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.bottomLeft,
                colors: [
                  logoBlue,
                  mainConColor,
                ],
              ),
              // color: logoBlue,
              // borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15)
              ]),
          child: Column(
            children: [
              // const Text(
              //   "Attendance Date",
              //   style: TextStyle(fontSize: 20),
              // ),
              SizedBox(
                height: mHeight / 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: Colors.red,
                      size: 40,
                    ),
                    Text(
                      "cityName",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(
                height: mHeight / 10,
              ),

              TextFieldWidget(
                  title: "Attendance Date",
                  wlength: 0,
                  hintText: "Date",
                  hlength: 10),
              TextFieldWidget(
                  title: "Staff Name",
                  wlength: 0,
                  hintText: "Name",
                  hlength: 10),

              SizedBox(
                height: mHeight / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: mHeight / 18,
                    width: mWidth / 3,
                    decoration: BoxDecoration(
                        color: logoBlue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$hour:$minute",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "$year/$month/$date",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mWidth / 25,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkOut = !checkOut;
                      });
                    },
                    child: Container(
                      height: mHeight / 18,
                      width: mWidth / 3,
                      decoration: BoxDecoration(
                          color: logoRed,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              checkOut ? "$hour:$minute" : "CheckOut",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              checkOut ? "$year/$month/$date" : "Click here",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mHeight / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      // fingerprintauthenticate();
                      LocalAuth().authenticate(context);
                    },
                    child: Container(
                      height: mHeight / 18,
                      width: mWidth / 3,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Text(
                        "Sumbit",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: mHeight / 18,
                      width: mWidth / 3,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
