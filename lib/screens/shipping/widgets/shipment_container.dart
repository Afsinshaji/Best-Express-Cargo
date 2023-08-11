import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/shipping/functions/bottomsheet_modal.dart';
import 'package:flutter/material.dart';

class ShipmentContainer extends StatelessWidget {
  const ShipmentContainer({
    super.key,
    required this.height,
    required this.width,
    required this.index,
  });

  final double height;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        bottomSheetModal(context, screenHeight);
      },
      child: Container(
        height: height / 15,
        width: width,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Color(0xFFbabcbe),
          color: whiteShade,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              // color: logoRed,
              offset: Offset(
                2.0,
                2.0,
              ),
              blurRadius: 8.0,
              // spreadRadius: 12.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        // child: ListTile(
        //   leading: Icon( Icons.local_shipping_outlined,size: 35,),
        //   title: Text("09876543"),
        // ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: mainConColor,
              child: Icon(
                Icons.airplanemode_on_outlined,
                color: logoBlue,
                size: 30,
              ),
            ),
            Text("asdf1324561234",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
