import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/const.dart';

// ignore: must_be_immutable
class ShipmentTextFieldWidget extends StatelessWidget {
  ShipmentTextFieldWidget({
    super.key,
    required this.title,
    required this.wlength,
    required this.hintText,
    required this.hlength,
     this.controller,
    this.keyboardType = false,
  });
  final String title;
  final double wlength;
  final double hlength;
  final String hintText;
   TextEditingController? controller;
  bool keyboardType;
  // bool _validate = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    //  double fontSize = screenWidth > 600 ? 24.0 : 16.0;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16,),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: GoogleFonts.sora(
              textStyle:  TextStyle(
                  fontSize: screenWidth/30, fontWeight: FontWeight.bold, color: logoRed)),
        ),
        Container(
          height: MediaQuery.of(context).size.height / hlength,
          width: MediaQuery.of(context).size.width / wlength,
          decoration: BoxDecoration(
              color: whiteShade,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: greyShade)),
          child: Padding(
            padding: const EdgeInsets.only( left: 15),
            child: TextFormField(
              maxLines: 1,
              // controller: controller,
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              keyboardType:
                  keyboardType ? TextInputType.number : TextInputType.text,
              cursorColor: Colors.black,
              // minLines: 1,
              // maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
              ),
              style: 
                // height: 1,
               const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
             
            ),
          ),
        )
      ]),
    );
  }
}
