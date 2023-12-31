import 'package:best_seller/screens/booking/inside_screen/edit_shipment.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';

class BookingCargoTileWidget extends StatelessWidget {
  const BookingCargoTileWidget({super.key, this.index = 1,required this.snapshot});
  final int index;
  final snapshot;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  EditShipmentScreen(snapShot: snapshot,index: index),
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
                const BoxDecoration(shape: BoxShape.circle, color: logoBlue),
            child: Center(
              child: Text(
                "${index+1}",
                style: const TextStyle(
                    color: whiteShade,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title:  Text(snapshot[index].bookingNumber,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
