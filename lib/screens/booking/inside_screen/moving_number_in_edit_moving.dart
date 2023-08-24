import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/const.dart';

class BookingNumberInEditMoving extends StatelessWidget {
  const BookingNumberInEditMoving({
    super.key,
    required this.snapShot,
    required this.index,
  });

  final snapShot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Booking No.",
          style: GoogleFonts.sora(
              textStyle: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: logoRed)),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 9,
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
              color: whiteShade,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: greyShade)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              snapShot[index].movingNumber,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: MediaQuery.sizeOf(context).width / 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
