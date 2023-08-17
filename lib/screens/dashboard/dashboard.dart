
import 'package:best_seller/common/rflutter.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<DashBoardProvider>(context).initPrefsAndToken();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 10,
            ),
            Text(
              'Dash',
              style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: mainConColor),
            ),
            Text(
              "bo",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "ard",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: mainConColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                signOutDilogueBox(context);
              },
              icon: const Icon(
                Icons.logout,
                color: whiteShade,
                size: 25,
              )),
        ],
      ),
      // backgroundColor: mainConColor,
      //  body:
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DashBoardProvider>(
              builder: (context, value, child) => 
              Center(
                  child: Text(
              value. myToken ?? 'Dash',
                style: const TextStyle(fontSize: 30, color: logoBlue),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
