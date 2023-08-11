import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/const.dart';

class AssignedShipmentsScreen extends StatelessWidget {
  const AssignedShipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios,color: whiteShade,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Assi",
              style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: mainConColor),
            ),
            Text(
              "gned",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              " Ship",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: mainConColor,
              ),
            ),
            Text(
              "ments",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
