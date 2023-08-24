import 'dart:developer';

import 'package:best_seller/providers/booking_provider.dart';
import 'package:best_seller/screens/booking/widgets/booking_cargo_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CargoScreen extends StatelessWidget {
  const CargoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: height / 60,
                left: width / 25,
                right: width / 25,
                bottom: height / 120),
            child: SizedBox(
              height: height / 22,
              child: const CupertinoSearchTextField(
                suffixIcon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  size: 22,
                ),
                backgroundColor: Color.fromARGB(255, 216, 211, 211),
              ),
            ),
          ),
          FutureBuilder(
              future: Provider.of<BookingProvider>(context)
                  .bookingResponse(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                    // child: Image.asset(
                    //   "asset/looney-locator.gif",
                    //   scale: 1,
                    // ),
                    child: Text("No Network"),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  final fullDataList = snapshot.data!;
                  log(fullDataList.toString());
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: fullDataList.length,
                      itemBuilder: (context, index) => BookingCargoTileWidget(
                          index: index, snapshot: fullDataList),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
