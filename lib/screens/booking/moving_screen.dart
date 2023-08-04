import 'package:best_seller/screens/booking/widgets/booking_moving_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovingScreen extends StatelessWidget {
  const MovingScreen({super.key});

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
             Expanded(
             child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 22,
              itemBuilder: (context, index) =>  BookingMovingTileWidget(index: index+1),
             
             ),
           ),
        ],
      )
    );
  }
}