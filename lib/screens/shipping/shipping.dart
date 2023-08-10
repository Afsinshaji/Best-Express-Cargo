import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/shipping/widgets/shipment_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ship",
                style: GoogleFonts.baloo2(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: mainConColor),
              ),
              Text(
                "m",
                style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "ent",
                style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: mainConColor,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ShipmentContainer(
                    height: height, width: width, index: index + 1),
                itemCount: 22,
              ),
            )
        //     Card(
        //       elevation:6,
        //       margin: const EdgeInsets.all(10),
        //       child: ListTile(
        //   leading: CircleAvatar(
        //     backgroundColor: Color.fromARGB(255, 83, 77, 77),
        //     child: Text("1"),
        //   ),
        //   title: Text("09876543"),
        
        //   trailing: const Icon(Icons.add_a_photo),
        // ),
        //     )
          ],
        ));
  }
}
