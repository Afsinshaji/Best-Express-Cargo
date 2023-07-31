import 'package:best_seller/common/shipment_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/floating_button.dart';

class EditShipmentScreen extends StatelessWidget {
  const EditShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Shipment",
          style: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyLarge,
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height:height / 35,
          ),
          Row(
            
            children: [
              SizedBox(
            width:width / 22,
          ),
              Text("Basic Info",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              
            ],
          ),
          ShipmentTextFieldWidget(
              title: "Booking No.",
              wlength: 0,
              hintText: "TB10019",
              hlength: 22),
          ShipmentTextFieldWidget(
              title: "Booking No.",
              wlength: 0,
              hintText: "TB10019",
              hlength: 22),
        ],
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }
}
