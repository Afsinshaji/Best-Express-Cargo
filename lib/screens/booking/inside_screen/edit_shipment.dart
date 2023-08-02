import 'package:best_seller/common/shipment_textfield.dart';
import 'package:best_seller/screens/booking/widgets/date_in_shipping_info.dart';
import 'package:best_seller/screens/booking/widgets/drop_down_widget.dart';
import 'package:best_seller/screens/booking/widgets/submit_button_in_edit_shipment.dart';
import 'package:best_seller/screens/booking/widgets/title_info_in_edit_shipment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/floating_button.dart';
import '../widgets/sender_receiver_with_button.dart';

class EditShipmentScreen extends StatelessWidget {
  const EditShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

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
                    title: "Booking No.",
                    wlength: 2.5,
                    hintText: "TB10019",
                    hlength: 22),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: DropDownListWidget(
                      boxWidth: 200,
                      title: "Branch List",
                      hintText: "Select Branch List"),
                ),
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
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            const TitleInfoWidget(
              heading: 'Receiver Info',
            ),
            const SenderReceiverWithButtonWidget(
              dropTitle: "Receiver/Customer",
              dropHint: "Select Branch List",
              textFieldTitle: "Receiver  Address",
              textFieldHint: "Kalamassery , ernakulam, kerala",
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
                    boxWidth: 200,
                    title: "Courier Company",
                    hintText: "Select Courier Company"),
                DropDownListWidget(
                    boxWidth: 200,
                    title: "Shipping Methods",
                    hintText: "Select Shipping Methods"),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropDownListWidget(
                    boxWidth: 200,
                    title: "Payment Method",
                    hintText: "Select Payment Method"),
                DropDownListWidget(
                    boxWidth: 200, title: "Status", hintText: "Select Status"),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DateInShippingInfo(),
                DropDownListWidget(
                    boxWidth: 200, title: "Collected By", hintText: "Select"),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   width: width / 150,
                // ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 3.6),
                  child: DropDownListWidget(
                      boxWidth: 200,
                      title: "Delivery Type",
                      hintText: "Select Delivery Type"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: ShipmentTextFieldWidget(
                      title: "Booking No.",
                      wlength: 2.2,
                      hintText: "TB10019",
                      hlength: 22),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: DropDownListWidget(
                  boxWidth: 400,
                  title: "Staff Name",
                  hintText: "Select Staff Name"),
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SubmitButtonInEditShipment(
                  width: width,
                  height: height,
                  color: Colors.green,
                  text: "Submit",
                  function: () => submit(context),
                ),
                SubmitButtonInEditShipment(
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
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }

  submit(BuildContext context) {
    // AnimatedSnackBar.rectangle("Success", "Successfully Submitted",
    //         type: AnimatedSnackBarType.success)
    //     .show(context);
    Navigator.of(context).pop();
  }

  cancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
