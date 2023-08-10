import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/booking/inside_screen/edit_moving_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingMovingTileWidget extends StatelessWidget {
  const BookingMovingTileWidget({super.key, this.index = 0});

  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditMovingScreen(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height / 15,
        margin: const EdgeInsets.only(left: 15, right: 15, top: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              // color: logoRed,
              offset: Offset(
                2.0,
                2.0,
              ),
              blurRadius: 10.0,
              // spreadRadius: 12.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: whiteShade,
        ),
        child: ListTile(
          leading: Container(
            width: MediaQuery.sizeOf(context).width / 12,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: logoRed),
            child: Center(
              child: Text(
                "$index",
                style: const TextStyle(
                    color: whiteShade,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: const Text("Booking No",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
