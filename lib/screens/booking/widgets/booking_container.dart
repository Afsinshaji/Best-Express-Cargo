import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/booking/inside_screen/edit_shipment.dart';
import 'package:flutter/material.dart';

class BookingContainerWidget extends StatelessWidget {
  const BookingContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditShipmentScreen(),
          ),
        );
      },
      child: Container(
          height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width / 3,
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: mainConColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 15.0,
                offset: Offset(
                  5,
                  5,
                ),
              )
            ],
          ),
          child: const Center(
            child: Text(
              "Booking ID",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}
