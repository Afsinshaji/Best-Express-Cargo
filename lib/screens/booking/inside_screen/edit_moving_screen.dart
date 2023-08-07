import 'package:best_seller/screens/booking/widgets/date_in_edit_moving.dart';
import 'package:best_seller/screens/booking/widgets/sender_address_adding_button.dart';
import 'package:best_seller/screens/booking/widgets/title_info_in_edit_shipment.dart';
import 'package:best_seller/screens/booking/widgets/update_button_in_edit_moving.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/shipment_textfield.dart';
import '../widgets/drop_down_widget.dart';

class EditMovingScreen extends StatelessWidget {
  const EditMovingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Moving",
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height / 35,
            ),
            const TitleInfoWidget(
              heading: 'Basic Info',
            ),
            Row(
              children: [
                ShipmentTextFieldWidget(
                    title: "Moving No.",
                    wlength: 2.5,
                    hintText: "123",
                    hlength: 19),
                const DropDownListWidget(
                    boxWidth: 2,
                    title: "Branch List",
                    hintText: "Select Branch List"),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            const TitleInfoWidget(
              heading: 'Sender Info',
            ),
            const SenderReceiverWithButtonWidget(
              dropTitle: "Sender/Customer",
              dropHint: "Select Branch List",
              textFieldTitle: "Sender Address",
              textFieldHint: "Kalamassery , ernakulam, kerala",
            ),
            ShipmentTextFieldWidget(
              title: "Phone",
              wlength: 0,
              hintText: "Phone Number",
              hlength: 19),
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropDownListWidget(
                    boxWidth: 2.3,
                    title: "Source",
                    hintText: "Select Source"),
                DropDownListWidget(
                    boxWidth: 2.3,
                    title: "Destination",
                    hintText: "Select Destination"),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            
            const TitleInfoWidget(heading: "Shipping Info"),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropDownListWidget(
                      boxWidth: 2.3,
                      title: "Courier Company",
                      hintText: "Select Courier Company"),
                  DropDownListWidget(
                      boxWidth: 2.3,
                      title: "Payment Method",
                      hintText: "Select Payment Method"),
                ],
              ),
              SizedBox(
                height: height / 50,
              ),
               const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(width: width/150,),
                  DateInEditMoving(),
                  DropDownListWidget(
                      boxWidth: 2.3, title: "Collected By", hintText: "Select"),
                ],
              ),
              SizedBox(
                height: height / 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropDownListWidget(
                      boxWidth: 2.3,
                      title: "Status",
                      hintText: "Select Status"),
                  DropDownListWidget(
                      boxWidth: 2.3,
                      title: "Delivery Type",
                      hintText: "Select Delivery Type"),
                ],
              ),
                const Padding(
                padding: EdgeInsets.all(15),
                child: DropDownListWidget(
                    boxWidth: 1,
                    title: "Driver Name",
                    hintText: "Select Driver"),
              ),

 SizedBox(
              height: height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UpdateButtonInEditMoving(
                  width: width,
                  height: height,
                  color: Colors.green,
                  text: "Update",
                  function: () => submit(context),
                ),
                UpdateButtonInEditMoving(
                  width: width,
                  height: height,
                  color: Colors.red,
                  text: "Cancel",
                  function: () => cancel(context),
                )
              ],
            ),
            SizedBox(
              height: height / 10,
            )          ],
        ),
      ),
    );
  }
  
  submit(BuildContext context) {
    Navigator.of(context).pop();
  }
  
  cancel(BuildContext context) {
     Navigator.of(context).pop();
  }
}
